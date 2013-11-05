class AddExternalTokenExternalTokenExpirationToTokens < KaExtUsers::ExtMigration
	def up
		add_column :tokens, :external_token, :string
		add_column :tokens, :external_token_expiration, :integer
	end

	def down
		drop_column :tokens, :external_token
		drop_column :tokens, :external_token_expiration
	end
end