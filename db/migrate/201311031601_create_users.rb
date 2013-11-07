class CreateUsers < KaExtUsers::ExtMigration
	def up
		create_table :users do |t|
			t.string :email
			t.string :fname
			t.string :lname

			t.timestamps
		end
	end

	def down
		drop_table :users
	end
end