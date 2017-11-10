require "jsonapi-resources"

module JSONAPI
  module Resources
    module Home
      require_relative "../acts_as_resource_controller"
      require_relative "home/inflector"
      require_relative "home/engine"
    end
  end
end
