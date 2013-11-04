class CreateProducts < ActiveRecord::Migration
	def up
		create_table :tokens do |t|
			t.user_id :integer
			t.website_id :integer
			t.token :string

			t.timestamps
		end
	end

	def down
		drop_table :tokens
	end
end