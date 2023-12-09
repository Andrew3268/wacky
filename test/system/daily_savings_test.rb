require "application_system_test_case"

class DailySavingsTest < ApplicationSystemTestCase
  setup do
    @daily_saving = daily_savings(:one)
  end

  test "visiting the index" do
    visit daily_savings_url
    assert_selector "h1", text: "Daily savings"
  end

  test "should create daily saving" do
    visit daily_savings_url
    click_on "New daily saving"

    fill_in "Title", with: @daily_saving.title
    click_on "Create Daily saving"

    assert_text "Daily saving was successfully created"
    click_on "Back"
  end

  test "should update Daily saving" do
    visit daily_saving_url(@daily_saving)
    click_on "Edit this daily saving", match: :first

    fill_in "Title", with: @daily_saving.title
    click_on "Update Daily saving"

    assert_text "Daily saving was successfully updated"
    click_on "Back"
  end

  test "should destroy Daily saving" do
    visit daily_saving_url(@daily_saving)
    click_on "Destroy this daily saving", match: :first

    assert_text "Daily saving was successfully destroyed"
  end
end
