module KaExtUsers
  class ApplicationController < ActionController::Base
	include Roar::Rails::ControllerAdditions
	respond_to :json
  end
end