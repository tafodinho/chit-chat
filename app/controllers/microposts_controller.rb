class MicropostsController < ApplicationController
    before_action :require_login
    def new
    end
    def create
        @micropost = @current_user.microposts.create(micropost_params)
        flash[:success] = "New post created"
        redirect_to new_micropost_path
    end
     
    private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
