class MessagesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params

    if @message.valid?
      email = MessageMailer.contact_me(@message)
      email.deliver_now
      redirect_to root_path, notice: "Message envoyé, merci"
    else
      redirect_to root_path, alert: "Veuillez remplir tout les champs demandés"
    end
  end

  private

  def message_params
    params.require(:message).permit(:first_name, :last_name, :email, :phone, :question)
  end
end
