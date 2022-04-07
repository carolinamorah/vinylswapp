class UsersController < ApplicationController
    
    def index
        @users = User.all
        
    end

    def new
        @user = User.new
    end

    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to tweets_url, notice: "User was successfully destroyed." }
            format.json { head :no_content }
        end
    end

end