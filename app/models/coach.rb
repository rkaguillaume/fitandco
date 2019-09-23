class Coach < ApplicationRecord
  belongs_to :user

  validates :name, :specialisation, presence: true
  mount_uploader :picture, PictureUploader
end
