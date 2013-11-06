module KaExtUsers
  class UsersController < KaExtUsers::ApplicationController
    represents :json, :entity => ::UserRepresenter, :collection => ::UsersRepresenter

    def index
        # filtering!
        conditions = {}
        if !params[:filter].nil?
            conditions[:email] = params[:filter][:email] unless params[:filter][:email].nil?
        end
        users = User.find_by(conditions)

        respond_with users
    end

    def show
        @user = User.find(params[:id])
        respond_with @user
    end

    def update
    	@user = User.find(params[:id])
    	if @user.update_attributes(users_params)
            head :no_content
        else
            head :bad_request
        end
    end

    def create
    	@user = User.new(users_params)

    	if @user.save
            respond_with @user
    	else
    		head :unprocessable_entity
    	end
    end

    def destroy
        User.find(params[:id]).destroy
        head :ok
    end

    private
		def users_params
			params.require(:user).permit(:email, :fname, :lname)
		end
  end
end