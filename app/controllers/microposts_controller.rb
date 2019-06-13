class MicropostsController < ApplicationController
    before_action :require_login

    def index
        
    end

    def new
    end

    def create
        @micropost = @current_user.microposts.create(micropost_params)
        flash[:success] = "New post created"
        redirect_to action: "index"
    end
     
    private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
