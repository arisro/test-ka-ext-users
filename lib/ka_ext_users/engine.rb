module KaExtUsers
  class Engine < Rails::Engine
    isolate_namespace KaExtUsers

	config.autoload_paths += Dir["#{config.root}/app/representers/**/"]
  end
end