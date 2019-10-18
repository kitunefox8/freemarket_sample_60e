class ImageTest < ApplicationRecord
  mount_uploader :image, ImageUploader
end
