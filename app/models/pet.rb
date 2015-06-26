class Pet < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  has_many :reports, dependent: :destroy

  # This method associates the attribute ":image" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
  default_url: lambda { |attach| "https://petid-assets.s3.amazonaws.com/images/:style/#{attach.instance.pet_type.downcase}.png" }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def age
    Time.now.year - birth_year.to_i
  end

end
