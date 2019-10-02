class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Successful Login'
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to microposts_path
    else
      flash.now[:danger] = 'Invalid login'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
