class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :kakao_user_id
      t.string :access_token
      t.string :refresh_token
      t.string :profile_image_url
      t.string :nickname

      t.timestamps
    end
  end
end
