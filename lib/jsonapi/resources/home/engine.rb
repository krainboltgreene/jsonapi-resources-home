module JSONAPI
  module Resources
    module Home
      class Engine < Rails::Engine
        isolate_namespace JSONAPI::Resources::Home
      end
    end
  end
end
