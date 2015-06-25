class ReportsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show_contact_user, :show]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.active_reports
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @pet_id = Pet.find(params[:id])

    if is_lost? @pet_id
      @report_id = @pet_id.reports.last.id
      redirect_to report_path(@report_id), alert: "There is already a report filed for this pet."
    elsif @pet_id.user.is current_user
      @report = Report.new
      @pet = Pet.find(params[:id])
    else
      redirect_to reports_path, alert: "Only the user can report a lost pet."
    end
  end

  # GET /reports/1/edit
  def edit
    if @report.user.is current_user
      @pet = @report.pet
    else
      redirect_to @report, alert: "Sorry, only the user who reported this can edit it."
    end
  end

  # POST /reports
  # POST /reports.json
  def create
    params[:report][:date_of_loss] = Date.strptime(params[:report][:date_of_loss], "%m/%d/%Y")
    @report = Report.new(report_params)
    @report.user = current_user

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to :back, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_contact_user
    @report = Report.find(params[:id])
    @user = @report.user
  end

  def process_contact_user
    @report = Report.find(params[:id])
    if simple_captcha_valid?
      @content = {reporter_name: params[:reporter_name],email: params[:email], phone: params[:phone], message: params[:message]}
      MyMailer.send_found_pet_message(@report,@content).deliver_now
      return redirect_to @report, notice: 'Message sent'
    else
      redirect_to show_contact_user_path(@report), alert: 'Invalid captcha.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:reward, :date_of_loss, :location, :user_id, :pet_id, :description, :notes, :is_active)
    end

end
