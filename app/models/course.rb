class Course < ApplicationRecord
  belongs_to :user
  validates :title, :subtitle, :description, presence: true
end
