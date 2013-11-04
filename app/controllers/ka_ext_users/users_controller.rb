module KaExtUsers
  class UsersController < ApplicationController
    represents :json, :entity => ::UserRepresenter, :collection => ::UsersRepresenter

    def index
      users = User.all
      respond_with users
    end

    def show  
        @user = User.find(params[:id])  	
        respond_with @user
    end

    def update
    	#@user = User.find(params[:id])
    	#if @user.update_attributes(params[:user])

    	render json: {:id => 2, :fname => "Fname2", :lname => "Lname2"}
    end

    def create
    	@user = User.new(users_params)

    	if @user.save
            respond_with @user
    	else
    		head :bad_request
    	end
    end

    def destroy
        @user = User.find(params[:id]).destroy
        head :ok
    end

    private
		def users_params
			params.require(:user).permit(:email, :fname, :lname)
		end
  end
end