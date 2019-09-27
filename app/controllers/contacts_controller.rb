class ContactsController < ApplicationController
  layout 'nonavbar'

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.build_contact(contact_params)

    if @contact.save
      redirect_to dashboard_path, notice: "Le cours a été ajoutée"
    else
      render :new, notice: "Quelque chose ne va pas"
    end
  end

  def edit
    if current_user.contact.nil?
      @contact = Contact.new
    else
      @contact = current_user.contact
    end
  end

  def update
    contact = current_user.contact

    if contact.update(contact_params)
      flash[:notice] = "Contact mis à jours"
    else
      flash[:notice] = "Problème"
    end
      redirect_to edit_user_contact_path
  end

  private

  def contact_params
    params.require(:contact).permit(
      :email,
      :emailbis,
      :address,
      :phone,
      :facebook,
      :instagram,
      :youtube,
      :twitter
    )
  end
end
