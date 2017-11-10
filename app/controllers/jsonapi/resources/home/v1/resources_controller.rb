module JSONAPI
  module Resources
    module Home
      module V1
        class ResourcesController < ::ApplicationController
          include JSONAPI::ActsAsResourceController

          home_discoverable description: "All discoverable HTTP API endpoints"
        end
      end
    end
  end
end
