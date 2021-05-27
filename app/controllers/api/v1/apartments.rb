module Api
  module V1
    class Apartments < Grape::API
      include Api::V1::Defaults

      resource :apartments do
        desc 'Return all graduates'
        get '', root: :apartments do
          Apartment.all
        end
      end
    end
  end
end
