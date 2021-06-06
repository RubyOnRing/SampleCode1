class House < ApplicationRecord
  belongs_to :agent
  has_many :client_apply_houses
  has_many :clients, class_name: 'Client', through: :client_apply_houses
end
