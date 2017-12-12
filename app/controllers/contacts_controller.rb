class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    contact = @company.contacts.new(contact_params)

    if contact.save
      flash[:success] = "Contact #{contact.full_name} added!"
      redirect_to company_path(@company)
    else
      flash[:notice] = "Missing contact information, please try again."
      redirect_to company_path(@company)
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:full_name, :position, :email)
    end

end
