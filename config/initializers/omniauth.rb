Rails.application.config.middleware.use OmniAuth::Builder do
    provider :kakao, ENV['KAKAO_CLIENT_ID'] , {:redirect_path =>'/auth/kakao/callback'}
end