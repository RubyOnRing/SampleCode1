# frozen_string_literal: true

class Agent < User
  has_many :houses
  belongs_to :entity
end
