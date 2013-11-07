module KaExtUsers
  class Engine < Rails::Engine
    isolate_namespace KaExtUsers

    @@config = nil

    initializer :append_migrations do |app|
    	unless app.root.to_s.match root.to_s
    		config.paths['db/migrate'].expanded.each do |expanded_path|
    			app.config.paths['db/migrate'] << expanded_path
    		end
    	end
    end

    initializer :set_secret_key_base do |app|
        app.config.secret_key_base = "xbWEbAhHMXZmmXOa95df"
    end

    def self.load_config
        config_file_path = "#{KaApi.root}/config/ka_ext_users.yml"
        if File.exists?(config_file_path)
            @@config = YAML::load_file(config_file_path)
        end
    end

    def self.root
        File.join(File.dirname(__FILE__), '../../')
    end

    def self.config
        self.load_config if @@config.nil?
        @@config
    end

    def self.database_config
        self.load_config if @@config.nil?
        @@config['database']
    end
  end
end