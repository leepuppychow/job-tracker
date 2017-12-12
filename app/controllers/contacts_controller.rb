class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    contact = @company.contacts.new(contact_params)

    if contact.save
      flash[:success] = "Contact #{contact.full_name} added!"
    else
      flash[:notice] = "Missing contact information, please try again."
    end
    redirect_to company_path(@company)
  end

  private

    def contact_params
      params.require(:contact).permit(:full_name, :position, :email)
    end

end
