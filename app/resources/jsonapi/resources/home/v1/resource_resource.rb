module JSONAPI
  module Resources
    module Home
      module V1
        class ResourceResource < ::ApplicationResource
          immutable

          model_name "JSONAPI::Resources::Home::V1::Resource"

          attribute :namespace
          attribute :version
          attribute :intent
          attribute :method
          attribute :href
          attribute :allowed
          attribute :mediatype
          attribute :description
          attribute :created_at
          attribute :updated_at

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
