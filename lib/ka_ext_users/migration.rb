module KaExtUsers	
	class ExtMigration < ActiveRecord::Migration
		def self.connection
			KaExtUsers::Engine::BaseModel.connection
		end
	end
end