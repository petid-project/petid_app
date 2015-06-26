class Report < ActiveRecord::Base
  validates :date_of_loss, presence: true
  validates :user, presence: true
  validates :pet, presence: true
  


  belongs_to :user
  belongs_to :pet



  def self.active_reports
  	@reports = Report.where(is_active: true).order(created_at: :desc)
  end

end
