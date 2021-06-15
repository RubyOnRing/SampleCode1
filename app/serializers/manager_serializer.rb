class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :type, :email, :subdomain, :avatar_url, :entity

  belongs_to :entity

end
