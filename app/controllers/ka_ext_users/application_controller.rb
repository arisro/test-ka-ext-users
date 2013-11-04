require 'roar/rails/controller_additions'

module KaExtUsers
  class ApplicationController < ActionController::Base
	#include Roar::Rails::ControllerAdditions

	# def self.responder
	# 	KaExtUsers::Responders::ApiResponder
	# end

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
  end
end