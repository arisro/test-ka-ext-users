require 'grape'
module KaExtUsers
	class UserResponseEntity < Grape::Entity
		expose :email, :fname, :lname
	end
end