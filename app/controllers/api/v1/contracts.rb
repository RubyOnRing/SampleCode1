# frozen_string_literal: true

module Api
  module V1
    class Contracts < Base
      include Api::V1::Defaults
      before do
        authenticate!
      end

      resource :contracts do
        desc 'All contracts'
        get '/', root: :contracts do
          authorize! :read, current_user.class
          current_entity.contracts
        end
      end
    end
  end
end
