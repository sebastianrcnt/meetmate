require "http"
require "json"

module ExternalApiModule
    module Kakao
        def self.request_token(auth_code)
            @response = HTTP.post("https://kauth.kakao.com/oauth/token", :form => {
                :grant_type => "authorization_code",
                :client_id => "1cf6615d2a113504c5661c5e415fe2e7",
                :redirect_uri => "http://localhost:3000/auth/kakao_login_code",
                :code => auth_code
            })
            
            @body = @response.parse
            @status_code = @response.status.code
            @token_success = @status_code == 200
            
            if @token_success
                return @body
            else
                raise @body["error"] + @body["error_description"]
            end
        end


        def self.get_user_info(access_token)
            @response = HTTP.auth("Bearer #{access_token}")
                .post("https://kapi.kakao.com/v2/user/me")
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
end
        
        # puts KakaoLoginFacade.request_token("MTeZP1Cf1t26lvyCbJsWMg41PK0uMxngAkYkDslpw7uK2LTMsUDlpPel5Xy6jCuxGm1YqAopb7kAAAF_p0pEmw")
        
        # $hash = {"access_token"=>"Ny60hFamrnm1PVubryJjAYppDCfJoiYBiYcGagopcSEAAAF_p0qJsg", "token_type"=>"bearer", "refresh_token"=>"FoyF4nqSOvjKya78iDnubuuX-H3BlKl9xXR2-QopcSEAAAF_p0qJsA", "id_token"=>"eyJraWQiOiI5ZjI1MmRhZGQ1ZjIzM2Y5M2QyZmE1MjhkMTJmZWEiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3MTkzMDkiLCJzdWIiOiIyMTY4Mjc1OTU3IiwiYXV0aF90aW1lIjoxNjQ3Nzc5MTU0LCJpc3MiOiJodHRwczovL2thdXRoLmtha2FvLmNvbSIsImV4cCI6MTY0NzgwMDc1NCwiaWF0IjoxNjQ3Nzc5MTU0fQ.kPhiP_TvxTgu4e8KFIcOsiINdtqu532zIV6qX7gm8hpS0oQEiBDdeAQqEhkLZj34W4i0g76FFiNEm17tjEGnT7R2wDJcD3RPnvth3TxpA9vJhoJ3bJ8-AvfERRsGGb91ijNKJQ3nmm9k8khowPHgun6gyZ4bQSlFJKLjF9CsZpRG2bInMBAPCU_80qJj1z_8kVTAktq-ikR5nSWDKzKivrzXZcreC4nQO0YFyMpGisnVMz9SKhln6bsRfsxuqOuIVx9UvKsulNXxolmVA6D8sefyWoVf-ITkB5I81zTccz545L7IHMzWxW2CHOWfA6z5BpIXNjsU3qxHBQphD2bdZw", "expires_in"=>21599, "scope"=>"profile_image openid profile_nickname", "refresh_token_expires_in"=>5183999}