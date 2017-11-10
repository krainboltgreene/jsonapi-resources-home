module JSONAPI
  module Resources
    module Home
      module V1
        class Resource
          include ActiveModel::Model

          MEDIATYPE = "application/vnd.api+json"
          private_constant :MEDIATYPE
          CREATED_AT = Time.now
          private_constant :CREATED_AT

          attr_accessor :namespace
          attr_accessor :version
          attr_accessor :intent
          attr_accessor :verb
          attr_accessor :href
          attr_accessor :allowed
          attr_accessor :mediatype
          attr_accessor :description
          attr_reader :route
          private :route

          def self.all
            routes.map(&method(:new)).select(&:valid?)
          end

          def self.where(attributes)
            all.where(attributes)
          end

          private_class_method def self.routes
            Rails.
              application.
              routes.routes.
              to_a
          end

          def initialize(route)
            @route = route
          end

          def id
            "#{namespace}-#{version}-#{intent}"
          end

          def intent
            if defaults.fetch(:action) == "index"
              "list"
            else
              defaults.fetch(:action)
            end
          end

          def version
            defaults.fetch(:controller).split("/").first
          end

          def namespace
            defaults.fetch(:controller).split("/").last
          end

          def description
            controller.instance_variable_get(:@jsonapi_resources_home_description)
          end

          def verb
            route.verb
          end

          def href
            File.join(controller.instance_variable_get(:@json_api_home_location) || ENV.fetch("HOME_LOCATION"), path)
          end

          def mediatype
            MEDIATYPE
          end

          def created_at
            CREATED_AT
          end

          def updated_at
            Time.now
          end

          def valid?
            !route.internal && defaults.any? && controller.instance_variable_get(:@jsonapi_resources_home)
          end

          private def payload
            route.parts.without(:format).map {|part| {part => "{#{part}}"}}.reduce(:merge) || {}
          end

          private def path
            URI.decode(route.format(payload))
          end

          private def controller
            "#{defaults.fetch(:controller).classify.pluralize}Controller".constantize
          end

          private def defaults
            route.defaults
          end
        end
      end
    end
  end
end
