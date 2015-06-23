class Pet < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_one :report
end
