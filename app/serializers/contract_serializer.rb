# frozen_string_literal: true

class ContractSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :code
end
