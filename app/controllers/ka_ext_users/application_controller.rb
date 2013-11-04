module KaExtUsers
  class ApplicationController < ActionController::Base
	include Roar::Rails::ControllerAdditions
	respond_to :json

	def self.responder
		KaExtUsers::Responders::ApiResponder
	end
  end
end