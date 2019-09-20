class Course < ApplicationRecord
  belongs_to :user
  has_many :photos, :dependent => :destroy

  validates :title, :subtitle, :description, presence: true
end
