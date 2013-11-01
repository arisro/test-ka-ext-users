module KaExtUsers
	class ExtDatabase < ActiveRecord::Base		
		establish_connection YAML::load_file("#{KaExtUsers::Engine.root}/config/database.yml")

		@@table_name = nil

		def self.table_name
			@@table_name
		end
	end
end