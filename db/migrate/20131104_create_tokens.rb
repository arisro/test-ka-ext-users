class CreateTokens < KaExtUsers::ExtMigration
	def up
		create_table :tokens do |t|
			t.integer :user_id
			t.integer :website_id
			t.string :token

			t.timestamps
		end
	end

	def down
		drop_table :tokens
	end
end