module KaExtUsers
	class API::Users < Grape::API
		version 'v1', :using => :path
		format :json

		resource :users do
			get '/' do
				users = User.all
				represent users
			end
			get '/:id' do
				user = User.where(:id => params[:id])
        		represent user
			end
			post '/' do
				@user = User.new(KaExtUsers::API::Users.users_params(params))
		    	if @user.save
		    		present @user
		    	else
		    		head :bad_request
		    		render json: { :status => 'error' }
		    	end
			end
			patch '/' do
				head :bad_request
		    	render json: { :status => 'error' }
			end
		end

		def self.users_params(params)
			safe_params = ActionController::Parameters.new(params).require(:user).permit( :email, :fname, :lname )
		end
	end
end