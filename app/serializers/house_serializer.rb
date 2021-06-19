class HouseSerializer < ActiveModel::Serializer
  attributes :id, :house_number, :street, :city, :post_code, :status, :max_people_allowed,
             :description, :start_hiring_date, :deposit, :rent_price, :state, :name

  belongs_to :contract
end
