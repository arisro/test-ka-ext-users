require 'representable/json/collection'

module TokensRepresenter
	include Representable::JSON::Collection

  	items extend: TokenRepresenter
end