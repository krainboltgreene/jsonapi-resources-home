module JSONAPI
  module ActsAsResourceController
    def self.included(target)
      target.define_singleton_method :home_discoverable do |description: nil, location: nil|
        instance_variable_set(:@jsonapi_resources_home, true)
        instance_variable_set(:@jsonapi_resources_home_description, true)
        instance_variable_set(:@jsonapi_resources_home_location, true)
      end

      super(target)
    end
  end
end
