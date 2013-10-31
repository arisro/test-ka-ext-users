KaExtUsers::Engine.routes.draw do
  resources :users, :constraints => KaExtUsers::IpWhitelistConstraint.new
end