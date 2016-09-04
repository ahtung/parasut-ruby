module OmniAuth
  module Strategies
    class Parasut < OmniAuth::Strategies::OAuth2
      option :name, 'parasut'
      option :client_options, {
        site: 'https://api.parasut.com',
        authorize_url: 'https://api.parasut.com/oauth/authorize',
        token_url: 'https://api.parasut.com/oauth/token'
      }

      uid { api.current_user.id }
      info { api.current_user }

      def api
        @api ||= Parasut::Client.new(access_token)
      end
    end
  end
end
