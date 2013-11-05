module TokenRepresenter
	include Roar::Representer::JSON

	property :id
	property :user_id
	property :website_id
	property :token
	property :external_token_expiration
end