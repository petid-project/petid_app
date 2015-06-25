class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet

  def self.active_reports
  	@reports = Report.where(is_active: true).order(created_at: :desc)
  end

end
