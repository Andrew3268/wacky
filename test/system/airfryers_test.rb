require "application_system_test_case"

class AirfryersTest < ApplicationSystemTestCase
  setup do
    @airfryer = airfryers(:one)
  end

  test "visiting the index" do
    visit airfryers_url
    assert_selector "h1", text: "Airfryers"
  end

  test "should create airfryer" do
    visit airfryers_url
    click_on "New airfryer"

    fill_in "Af title", with: @airfryer.af_title
    click_on "Create Airfryer"

    assert_text "Airfryer was successfully created"
    click_on "Back"
  end

  test "should update Airfryer" do
    visit airfryer_url(@airfryer)
    click_on "Edit this airfryer", match: :first

    fill_in "Af title", with: @airfryer.af_title
    click_on "Update Airfryer"

    assert_text "Airfryer was successfully updated"
    click_on "Back"
  end

  test "should destroy Airfryer" do
    visit airfryer_url(@airfryer)
    click_on "Destroy this airfryer", match: :first

    assert_text "Airfryer was successfully destroyed"
  end
end
