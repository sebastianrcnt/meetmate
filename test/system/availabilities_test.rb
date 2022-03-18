require "application_system_test_case"

class AvailabilitiesTest < ApplicationSystemTestCase
  setup do
    @availability = availabilities(:one)
  end

  test "visiting the index" do
    visit availabilities_url
    assert_selector "h1", text: "Availabilities"
  end

  test "creating a Availability" do
    visit availabilities_url
    click_on "New Availability"

    fill_in "Appointment", with: @availability.appointment_id
    fill_in "End time", with: @availability.end_time
    fill_in "Start time", with: @availability.start_time
    fill_in "User", with: @availability.user_id
    click_on "Create Availability"

    assert_text "Availability was successfully created"
    click_on "Back"
  end

  test "updating a Availability" do
    visit availabilities_url
    click_on "Edit", match: :first

    fill_in "Appointment", with: @availability.appointment_id
    fill_in "End time", with: @availability.end_time
    fill_in "Start time", with: @availability.start_time
    fill_in "User", with: @availability.user_id
    click_on "Update Availability"

    assert_text "Availability was successfully updated"
    click_on "Back"
  end

  test "destroying a Availability" do
    visit availabilities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Availability was successfully destroyed"
  end
end
