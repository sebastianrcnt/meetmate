require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Access token", with: @user.access_token
    fill_in "Kakao user", with: @user.kakao_user_id
    fill_in "Nickname", with: @user.nickname
    fill_in "Profile image url", with: @user.profile_image_url
    fill_in "Refresh token", with: @user.refresh_token
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Access token", with: @user.access_token
    fill_in "Kakao user", with: @user.kakao_user_id
    fill_in "Nickname", with: @user.nickname
    fill_in "Profile image url", with: @user.profile_image_url
    fill_in "Refresh token", with: @user.refresh_token
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
