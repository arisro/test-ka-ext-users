module KaExtUsers
  class Engine < Rails::Engine
    isolate_namespace KaExtUsers

    config.middleware.use Rack::MethodOverride
  end
end