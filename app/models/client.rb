# frozen_string_literal: true

class Client < User
  has_many :client_apply_houses
  has_many :applied_houses, class_name: 'House', through: :client_apply_houses, source: :house
  has_many :documents
end
