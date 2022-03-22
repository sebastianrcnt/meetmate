json.extract! user, :id, :kakao_user_id, :access_token, :refresh_token, :profile_image_url, :nickname, :created_at, :updated_at
json.url user_url(user, format: :json)
