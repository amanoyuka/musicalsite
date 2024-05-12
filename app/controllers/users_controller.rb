class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
    end
    private
      def musical_params
        params.require(:user).permit(:image)
      end
end
