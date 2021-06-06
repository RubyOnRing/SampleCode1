class HouseSerializer < ActiveModel::Serializer
  attributes :id, :house_number, :street, :city, :post_code, :status, :max_people, :description,
    :start_at, :deposit_amount, :price, :length_of_contract, :state
end
