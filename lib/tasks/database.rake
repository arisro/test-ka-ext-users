namespace :ka do
	namespace :extusers do
		namespace :db do
			desc 'Migrates the ka users extension databases'
			task :migrate => :environment do
				ActiveRecord::Base.establish_connection KaExtUsers::Engine.database_config
				ActiveRecord::Migrator.migrate("#{File.dirname(__FILE__)}/../../db/migrate", ENV['VERSION'].try(:to_i))
			end

			desc 'Dumps the schema.rb file.'
			task :'schema:dump' do
				require 'active_record/schema_dumper'
				schema_path = File.expand_path('../../../db/schema.rb', __FILE__)
				File.open(schema_path, 'w') do |file|
					ActiveRecord::SchemaDumper.dump KaExtUsers::ExtDatabase.connection, file
					puts "Schema dumped into #{schema_path}"
				end
			end

			desc 'Loads a schema.rb file.'
			task :'schema:load' do
				schema_path = File.expand_path('../../../db/schema.rb', __FILE__)
				puts "Loading schema from #{schema_path}"
				load schema_path
			end
		end
	end
end