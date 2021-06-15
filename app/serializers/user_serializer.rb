class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :type, :email, :subdomain, :avatar_url, :full_name
end
