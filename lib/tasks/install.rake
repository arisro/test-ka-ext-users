require 'rails/generators'
require "#{KaExtUsers::Engine.root}/lib/generators/ka_ext_users/install_generator.rb"

namespace :ka do
	namespace :extusers do
		desc 'Migrates the ka users extension database'
		task :install => :environment do
			gen = KaExtUsers::Generators::InstallGenerator.new
			gen.copy_config
			gen.setup_route
		end
	end
end