class Message < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :email, :phone, :question
  validates :first_name, :last_name, :email, :phone, :question, presence: true
end
