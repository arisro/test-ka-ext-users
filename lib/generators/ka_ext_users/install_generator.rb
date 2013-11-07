module KaExtUsers
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.expand_path("../templates", __FILE__)

			desc 'Creates the config file in the main application and mounts the engine on a route.'

			def copy_config
				config_file = "config/ka_ext_users.yml"
				if !File.exists?(config_file)
					copy_file 'config.yml', config_file
				end
			end

			def setup_route
				route "mount KaExtUsers::Engine => '/extusers/'"
			end

			def self.source_root
				File.expand_path("../templates", __FILE__)
			end
		end
	end
end