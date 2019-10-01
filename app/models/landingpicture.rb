class Landingpicture < ApplicationRecord
  belongs_to :user

  mount_uploader :image, HomepicUploader
end
