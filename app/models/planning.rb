class Planning < ApplicationRecord
  belongs_to :user

  validates :title, :plan_img, presence: true
  mount_uploader :plan_img, PlanimgUploader
end
