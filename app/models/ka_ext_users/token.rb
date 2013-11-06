module KaExtUsers
	class Token < KaExtUsers::ExtDatabase
		self.table_name = "tokens"

		belongs_to :user, :class_name => 'KaExtUsers::User'

		before_create :generate_access_token

		private
			def generate_access_token
				begin
					self.token = SecureRandom.hex(16)
				end while self.class.exists?(token: token)
			end
	end
end