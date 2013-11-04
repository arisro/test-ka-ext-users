module KaExtUsers
	module UserRepresenter
		include Roar::Representer::JSON

		property :id
		property :email
		property :fname
		property :lname	
	end
end