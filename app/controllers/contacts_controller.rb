class ContactsController < ApplicationController
  def show
    render json: Contact.find(params[:id])
  end

  def index
    render json: Contact.where(user_id: params[:user_id])
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact
    else
      render_errors
    end
  end

  def update
    contact = Contact.find(params[:id])

    if contact.save
      render json: contact
    else
      render_errors
    end

    def destroy
      contact = Contact.find(params[:id])

      if contact.destroy
        render text: "Contact #{params[:id]} deleted"
      else
        render_errors
      end
    end
  end

  private

    def contact_params
      params[:contact].permit(:name, :email, :user_id)
    end

    def render_errors
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
end
