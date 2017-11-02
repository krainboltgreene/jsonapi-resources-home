module JSONAPI
  module Resources
    module Home
      module V1
        class ResourceResource < ApplicationResource
          immutable

          attribute :namespace
          attribute :version
          attribute :intent
          attribute :method
          attribute :href
          attribute :allowed
          attribute :mediatype
          attribute :description

          def self.default_sort
            []
          end

          def method
            @model.method
          end
        end
      end
    end
  end
end
