class House < ApplicationRecord
  belongs_to :agent
  has_many :client_apply_houses
  has_many :clients, class_name: 'Client', through: :client_apply_houses
  belongs_to :contract

  validates_presence_of :deposit, :rent_price, :name, :house_number, :address, :city, :state,
                        :post_code, :max_people_allowed
end
