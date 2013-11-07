namespace :ka do
	namespace :extusers do
		namespace :db do
			desc 'Migrates the ka users extension database'
			task :migrate => :environment do
				ActiveRecord::Base.establish_connection KaExtUsers::Engine.database_config
				ActiveRecord::Migrator.migrate("#{File.dirname(__FILE__)}/../../db/migrate", ENV['VERSION'].try(:to_i))
				Rake::Task["ka:extusers:db:schema:dump"].invoke
			end

			desc 'Create extension tables'
			task :create => :environment do
				ActiveRecord::Base.establish_connection KaExtUsers::Engine.database_config
				if ActiveRecord::Base.connection.tables.empty?
					Rake::Task["ka:extusers:db:schema:load"].invoke
				else
					puts "\tDatabase is not empty! Use ka:extusers:db:recreate if you want to rebuild it."
				end
			end

			desc 'Rereates extension tables'
			task :recreate => :environment do
				ActiveRecord::Base.establish_connection KaExtUsers::Engine.database_config
				Rake::Task["ka:extusers:db:schema:dump"].invoke
				Rake::Task["ka:extusers:db:schema:load"].invoke
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

			desc 'Drops all tables and recreates fomr schema.rb.'
			task :'schema:load' do
				schema_path = File.expand_path('../../../db/schema.rb', __FILE__)
				puts "Loading schema from #{schema_path}"
				ActiveRecord::Base.establish_connection KaExtUsers::Engine.database_config
				load schema_path
			end
		end
	end
end