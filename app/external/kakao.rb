require 'http'
require 'json'

module Kakao
    def self.request_token(auth_code, redirect_uri)
        @response =
            HTTP.post(
                'https://kauth.kakao.com/oauth/token',
                form: {
                    grant_type: 'authorization_code',
                    client_id: '1cf6615d2a113504c5661c5e415fe2e7',
                    redirect_uri: redirect_uri,
                    code: auth_code
                }
            )

        @body = @response.parse
        @status_code = @response.status.code
        @token_success = @status_code == 200

        puts @body

        if @token_success
            return @body
        else
            raise @body['error'] + @body['error_description']
        end
    end

    def self.get_user_info(access_token)
        @response =
            HTTP
                .auth("Bearer #{access_token}")
                .post('https://kapi.kakao.com/v2/user/me')
        @body = @response.parse
        @status_code = @response.status.code
        @success = @status_code == 200

        if @success
            return @body
        else
            raise @body.to_s
        end
    end

    def self.unlink(access_token)
        @response =
            HTTP
                .auth("Bearer #{access_token}")
                .post('https://kapi.kakao.com/v1/user/unlink')
        @body = @response.parse
        @status_code = @response.status.code
        @success = @status_code == 200

        if @success
            return @body
        else
            raise @body.to_s
        end
    end
end
