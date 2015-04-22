class Messageee < ActiveRecord::Base
  attr_accessible :gallery_id, :asd, :image, :remote_image_url
  belongs_to :gallery
  mount_uploader :image, ImageUploader
end
