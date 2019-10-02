class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to access this section'
      redirect_to root_url # halts request cycle
    end
  end
end
