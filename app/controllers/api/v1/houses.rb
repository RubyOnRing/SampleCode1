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
          current_entity.houses
        end
      end
    end
  end
end
