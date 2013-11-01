module KaExtUsers
	class API < Grape::API
		format :json

		version 'v1', :using => :header, :vendor => "App"

		resource :users do
			get '/' do
				users = User.all
				present users
			end
			get '/:id' do
				user = User.where(:id => params[:id])
        		present user
			end
			post '/' do
				@user = User.new(KaExtUsers::API.users_params(params))
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