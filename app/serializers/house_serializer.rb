class HouseSerializer < ActiveModel::Serializer

  attributes :id, :house_number, :street, :city, :post_code, :status, :max_people
end
