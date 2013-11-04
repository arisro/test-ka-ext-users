require 'roar/rails/responder'

module KaExtUsers
  module Responders
    class ApiResponder < ActionController::Responder
      include Roar::Rails::Responder

      def display(resource, given_options={})
        if represent_format?
          handle_lonely_collection!(resource) and return super # :represent_items_with

          resource = prepare_model_for(format, resource, options)
        end

        controller.render given_options.merge!(options).merge!(format => resource)
      end
    end
  end
end