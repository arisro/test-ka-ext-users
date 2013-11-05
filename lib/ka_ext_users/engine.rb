module KaExtUsers
  class Engine < Rails::Engine
    isolate_namespace KaExtUsers

    @@database_config = YAML::load_file("#{self.root}/config/database.yml")
    
    initializer :append_migrations do |app|
    	unless app.root.to_s.match root.to_s
    		config.paths['db/migrate'].expanded.each do |expanded_path|
    			app.config.paths['db/migrate'] << expanded_path
    		end
    	end
    end

    def self.root
        File.join(File.dirname(__FILE__), '../../')
    end

    def self.database_config
        @@database_config
    end
  end
end