module JSONAPI
  module Resources
    module Home
      class ResourcePresenter
        MEDIATYPE = "application/vnd.api+json"

        attr_reader :route

        def self.all
          Rails.application.routes.routes.to_a.reject(&:internal).map(&method(:new))
        end

        def initialize(route)
          @route = route
        end

        def to_hash
          {
            "intent" => intent,
            "version" => version,
            "namespace" => namespace,
            "description" => description,
            "method" => route.verb,
            "href" => href,
            "allowed" => [],
            "mediatype" => MEDIATYPE
          }
        end

        def intent
          if route.defaults[:action] == "index"
            "list"
          else
            route.defaults[:action]
          end
        end

        def version
          route.defaults[:controller].split("/").first
        end

        def namespace
          route.defaults[:controller].split("/").last
        end

        def description
          "A generated route"
        end

        def href
          File.join(ENV["ORIGIN_LOCATION"], path)
        end

        private def payload
          route.parts.without(:format).map {|part| {part => "{#{part}}"}}.reduce(:merge) || {}
        end

        private def path
          URI.decode(route.format(payload))
        end
      end
    end
  end
end
