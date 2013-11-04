namespace :ka do
	namespace :extusers do
		namespace :db do
			desc 'Migrates the ka users extension databases'
			task :migrate => :environment do
				ActiveRecord::Base.establish_connection KaExtUsers::Engine.database_config
				ActiveRecord::Migrator.migrate("#{File.dirname(__FILE__)}/../../db/migrate", ENV['VERSION'].try(:to_i))
			end

			desc 'zzz'
			task :'schema:dump' do
				require 'active_record/schema_dumper'
				File.open(File.expand_path('../../../db/schema_dump.rb', __FILE__), 'w') do |file|
					ActiveRecord::SchemaDumper.dump KaExtUsers::Engine::BaseModel.connection, file
				end
			end
		end
	end
end