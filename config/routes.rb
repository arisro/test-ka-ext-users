require 'ka_ext_users/constraints/ip_whitelist_constraint'

KaExtUsers::Engine.routes.draw do
  constraint KaExtUsers::IpWhitelistConstraint.new do
    resources :users
  end
end