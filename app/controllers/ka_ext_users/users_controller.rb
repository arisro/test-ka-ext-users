module KaExtUsers
  class UsersController < ApplicationController
    respond_to :json

    def index
      users = User.all
      render json: users
      #respond_with(users, represent_with: KaExtUsers::UserRepresenter)
    end

    def show  
        @user = User.find(params[:id])  	
        respond_with @user, :represent_with => KaExtUsers::UserRepresenter

        # respond_with(@user) do |format|
        #     format.json { render }
        # end
        #render json: user
    end

    def update
    	#@user = User.find(params[:id])
    	#if @user.update_attributes(params[:user])

    	render json: {:id => 2, :fname => "Fname2", :lname => "Lname2"}
    end

    def create
    	@user = User.new(users_params)

    	if @user.save
    		render text: @user.to_json
    	else
    		head :bad_request
    	end
    end

    def delete

    end

    private
		def users_params
			params.require(:user).permit(:email, :fname, :lname)
		end
  end
end