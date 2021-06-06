module Api
  module V1
    class Houses < Base
      include Api::V1::Defaults
      before do
        authenticate!
      end

      resource :houses do
        desc 'Return all houses'
        get '', root: :houses do
          authorize! :read, House
          current_entity.houses
        end

        desc 'Create house'
        params do
          requires :house, type: Hash do
            requires :house_number, type: String
            optional :street, type: String
            optional :city, type: String
            optional :post_code, type: String
            optional :max_people, type: Integer
            optional :status, type: String
            optional :description, type: String
            optional :start_at, type: DateTime
            optional :deposit_amount, type: Integer
            optional :price, type: Integer
            optional :length_of_contract, type: Integer
            optional :state, type: String
          end
        end

        post '', root: :houses do
          house = current_entity.houses.new permitted_params[:house]
          house.agent = current_user
          authorize! :create, House
          house.save!
          house
        end

        desc 'Update house'
        params do
          requires :house, type: Hash do
            requires :house_number, type: String
            optional :street, type: String
            optional :city, type: String
            optional :post_code, type: String
            optional :max_people, type: Integer
            optional :status, type: String
            optional :description, type: String
            optional :start_at,   type: DateTime
            optional :deposit_amount, type: Integer
            optional :price, type: Integer
            optional :length_of_contract, type: Integer
            optional :state, type: String
          end
        end

        patch '/:id', root: :houses do
          house = current_entity.houses.find(params[:id])
          authorize! :update, House
          house.update!(permitted_params[:house])
          house
        end

        desc 'Destroy house'
        delete '/:id', root: :houses do
          house = current_entity.houses.find(params[:id])
          authorize! :destroy, House
          house.destroy!
        end
      end
    end
  end
end
