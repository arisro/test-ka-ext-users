require 'roar/rails/controller_additions'

module KaExtUsers
  class ApplicationController < ActionController::Base
	include Roar::Rails::ControllerAdditions
	respond_to :json

	before_filter :protect
	before_filter :default_format_json

	def self.responder
		KaExtUsers::Responders::ApiResponder
	end

	rescue_from(ActiveRecord::RecordNotFound) do |exception|
		render nothing: true, status: 404
	end

	rescue_from(ActionController::ParameterMissing) do |exception|
		error = Hash[exception.param, 'parameter is required']
		render json: { errors: error }, status: :unprocessable_entity
	end

	def render_404
		render nothing: true, status: 404
	end

	def default_format_json
		request.format = "json" unless params[:format]
	end

	# this is how we can allow only internal calls
	def protect
		# @ips = ['127.0.0.1']
		# if not @ips.include? request.remote_ip
		# 	head :forbidden
		# 	return
		# end
	end
  end
end