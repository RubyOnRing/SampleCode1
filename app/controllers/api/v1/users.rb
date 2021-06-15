module Api
  module V1
    class Users < Base
      include Api::V1::Defaults
      before do
        authenticate!
      end

      resource :users do
        desc 'Return info profile'
        get 'me', root: :users do
          authorize! :read, current_user.class
          current_user
        end
      end
    end
  end
end
