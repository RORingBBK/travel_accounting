class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @accounts = Account.all
  end

end