module KaExtUsers
	class ExtDatabase < ActiveRecord::Base
		self.abstract_class = true
		establish_connection KaExtUsers::Engine.database_config unless KaExtUsers::Engine.database_config.nil?
	end
end