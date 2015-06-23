class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html, :js


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @pet = Pet.new
  end

  # GET /users/new
  def new
    @user = User.new
    @pet = Pet.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_pet
    @user_pet = Pet.new(pet_params)
    @user_pet.user = current_user

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @user_pet.user, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { redirect_to @pet.user }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :uid, :provider, :password, :password_confirmation, :name, :city, :state, :phone, :oauth_token, :oauth_expires_at)
    end

    def pet_params
      params.require(:pet).permit(:name, :type, :breed, :color, :weight, :birth_year, :user_id, :chip_id, :description, :image_url)
    end
end
