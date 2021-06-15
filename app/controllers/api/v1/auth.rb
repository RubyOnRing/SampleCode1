module Api
  module V1
    class Auth < Grape::API
      include Api::V1::Defaults

      resource :auth, serializer: UserSerializer do
        desc 'Login to get authentication token'
        params do
          requires :email, type: String, desc: 'Email'
          requires :password, type: String, desc: 'Password'
          requires :subdomain, type: String, desc: 'Company subdomain'
        end

        post 'login' do
          entity = Entity.find_by(subdomain: permitted_params[:subdomain])
          user = entity.users.find_by(email: permitted_params[:email])
          
          if user&.valid_password?(permitted_params[:password])
            expired_time = Time.now + 24.hours.to_i
            token = ::JsonWebToken.encode(resource_type: user.type, resource_id: user.id,
                                          exp: expired_time, subdomain: entity.subdomain)
            { access_token: token, expires_at: expired_time, resource_type: user.type, subdomain: entity.subdomain }
          else
            error!({ error: 'Invalid email or password', businesses: []}, 401)
          end
        end
      end
    end
  end
end
