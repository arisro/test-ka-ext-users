module KaExtUsers
	class ExtDatabase < ActiveRecord::Base		
		establish_connection KaExtUsers::Engine.database_config

		@@table_name = nil

		def self.table_name
			@@table_name
		end
	end
end