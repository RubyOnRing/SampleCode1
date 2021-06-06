class ClientApplyHouse < ApplicationRecord
  belongs_to :house
  belongs_to :client
end
