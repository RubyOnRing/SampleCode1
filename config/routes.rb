Rails.application.routes.draw do
  mount Api::Base => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
