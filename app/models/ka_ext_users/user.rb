module KaExtUsers
	class User < KaExtUsers::ExtDatabase
		@@table_name = "users"
		
		# needed only by postgres :/
		self.primary_key = 'id'

		class Entity < Grape::Entity
			expose :id, :email, :fname, :lname
		end
	end
end