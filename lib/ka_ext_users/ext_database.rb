module KaExtUsers
	class ExtDatabase < ActiveRecord::Base
		self.abstract_class = true
    puts KaExtUsers::Engine.database_config.inspect
		establish_connection KaExtUsers::Engine.database_config unless KaExtUsers::Engine.database_config.nil?
	end
end