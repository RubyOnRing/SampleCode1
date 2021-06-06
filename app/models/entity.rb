# frozen_string_literal: true

class Entity < ApplicationRecord
  has_many :users
  has_many :clients, class_name: 'Client'
  has_many :staffs, class_name: 'Staff'
  has_many :managers, class_name: 'Manager'
  has_many :contracts
  has_many :document_types

  def agents
    users.where(type: %w[Staff Manager])
  end

  def houses
    House.where(agent: agents)
  end
end
