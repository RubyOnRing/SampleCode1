class EntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :subdomain, :logo_url

  def logo_url
    if object.logo.attached?
      rails_blob_url(object.logo)
    else
      ActionController::Base.helpers.image_url("default_company.png")
    end
  end
end

