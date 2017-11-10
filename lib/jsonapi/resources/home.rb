require "jsonapi-resources"
require "array-where"

module JSONAPI
  module ActsAsResourceController
    module ClassMethods
      def home_discoverable(description: nil, location: nil)
        instance_variable_set(:@jsonapi_resources_home, true)
        instance_variable_set(:@jsonapi_resources_home_description, description)
        instance_variable_set(:@jsonapi_resources_home_location, location)
      end
    end
  end

  module Resources
    module Home
      require_relative "home/inflector"
      require_relative "home/engine"
    end
  end
end
