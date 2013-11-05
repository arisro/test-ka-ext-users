KaExtUsers::Engine.routes.draw do
	resources :tokens
	
 	resources :users do
 		resources :tokens
 	end
end