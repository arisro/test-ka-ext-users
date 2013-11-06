module KaExtUsers
	class User < KaExtUsers::ExtDatabase
		self.table_name = "users"

		has_many :tokens, :class_name => "KaExtUsers::Token"

		def token_for_website(website_id)
			tokens.find_by(:website_id => website_id)
		end
	end
end