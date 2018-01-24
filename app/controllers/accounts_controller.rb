class AccountsController < ApplicationController
  before_action :authenticate_user!
  
  respond_to :html, :json
  def index
    @accounts = Account.all
  end

  def update
    @account = Account.find(params[:id])
    @account.update_attributes(account_params)
    respond_with @account
  end

  private

  def account_params
    params.require(:account).permit(:code, :name, :description, :debit, :credit)
  end
  
end