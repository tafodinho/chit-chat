class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Successful Login"
    else 
      flash.now[:danger] = "Invalid login"
      render 'new'
    end
  end
end
