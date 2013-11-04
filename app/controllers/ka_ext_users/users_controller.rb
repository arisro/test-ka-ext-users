module KaExtUsers
  class UsersController < KaExtUsers::ApplicationController
    def index
      users = User.all
      #render json: {:id => 2, :fname => "Fname2", :lname => "Lname2"}
      respond_with(users, represent_with: KaExtUsers::UserRepresenter)
    end

    def show    	
    	render json: {:id => 2, :fname => "Fname2", :lname => "Lname2"}
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
    		render json: { :status => 'error' }
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