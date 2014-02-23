class Section < ActiveRecord::Base
  belongs_to :floor
  has_attached_file :image

  attr_accessible :latitude, :longitude, :nick,
                  :image, :image_updated_at, :image_file_name, :image_file_size, :image_content_type

  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png application/octet-stream)

  def image_url
    puts "hello"
    image.try(:url)
  end

end
