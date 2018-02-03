class AccountsController < ApplicationController
  before_action :authenticate_user!
  
  # respond_to :html
  def index
    @accounts = Account.all
  end

  def update
    @account = Account.find(params[:id])
    respond_to do |format|

      if params[:account_id]
        format.json { render json: { data: @account.credit }, status: :ok }
      else
        binding.pry
        @account.update_attributes(account_params)
        format.html { render action: :index}
        
      end 

    end 
      
      # respond_with @account
      # format.html { render }
  end

  private

  def account_params
    params.require(:account).permit(:code, :name, :description, :debit, :credit, :category)
  end
  
end