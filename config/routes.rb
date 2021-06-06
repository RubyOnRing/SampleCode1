Rails.application.routes.draw do
  constraints subdomain: Settings.subdomain do
    mount Api::Base => '/'
    mount GrapeSwaggerRails::Engine => '/swagger'
  end
end
