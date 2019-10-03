class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject
  #
  def contact_me(message)
    @first_name = message.first_name
    @last_name = message.last_name
    @email = message.email
    @phone = message.phone
    @question = message.question

    mail to: "cyril.guermont@hotmail.fr", from: message.email, subject: "Nouvelle demande de scéance d'éssai"
  end
end
