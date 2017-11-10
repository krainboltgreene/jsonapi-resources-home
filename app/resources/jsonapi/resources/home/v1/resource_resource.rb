module JSONAPI
  module Resources
    module Home
      module V1
        class ResourceResource < ::ApplicationResource
          key_type :string

          immutable

          model_name "JSONAPI::Resources::Home::V1::Resource"

          attribute :namespace
          attribute :version
          attribute :intent
          attribute :verb
          attribute :href
          attribute :allowed
          attribute :mediatype
          attribute :description
          attribute :created_at
          attribute :updated_at

          def self.default_sort
            []
          end
        end
      end
    end
  end
end
