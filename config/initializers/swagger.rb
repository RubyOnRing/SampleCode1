GrapeSwaggerRails.options.app_name = 'Estate Agent'
GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
  GrapeSwaggerRails.options.api_key_name = 'Authorization'
  GrapeSwaggerRails.options.api_key_type = 'header'
end
GrapeSwaggerRails.options.url = '/api/v1/swagger_doc'
GrapeSwaggerRails.options.app_url  = 'http://swagger.wordnik.com'
