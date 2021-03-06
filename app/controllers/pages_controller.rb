class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :courses, :coachs, :plannings, :subscriptions, :contact_us, :legal_notices, :general_condition_sale]

  def home
    @courses = Course.all
    @photos = Photo.all
    @pictures = Landingpicture.all
    @message = Message.new
  end

  def courses
    @coachs = Coach.all.size
    @courses = Course.all
  end

  def coachs
    @coachs = Coach.all
  end

  def plannings
    @plannings = Planning.all
  end

  def subscriptions
    @prices = Price.all
  end

  def contact_us
    @main_email = User.first.contact.email
    @second_email = User.first.contact.emailbis
    @address = User.first.contact.address
    @phone = User.first.contact.phone

    @facebook = User.first.contact.facebook
    @instagram = User.first.contact.instagram
    @youtube = User.first.contact.youtube
    @twitter = User.first.contact.twitter
  end

  def general_condition_sale
  end

  def legal_notices
  end
end
