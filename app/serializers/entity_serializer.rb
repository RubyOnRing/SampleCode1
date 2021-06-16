class EntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :subdomain, :logo_url

  def logo_url
    if object.logo.attached?
      rails_blob_url(object.logo)
    else
      Settings.images.default_entity_logo_url
    end
  end
end

