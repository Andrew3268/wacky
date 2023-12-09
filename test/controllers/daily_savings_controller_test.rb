require "test_helper"

class DailySavingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_saving = daily_savings(:one)
  end

  test "should get index" do
    get daily_savings_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_saving_url
    assert_response :success
  end

  test "should create daily_saving" do
    assert_difference("DailySaving.count") do
      post daily_savings_url, params: { daily_saving: { title: @daily_saving.title } }
    end

    assert_redirected_to daily_saving_url(DailySaving.last)
  end

  test "should show daily_saving" do
    get daily_saving_url(@daily_saving)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_saving_url(@daily_saving)
    assert_response :success
  end

  test "should update daily_saving" do
    patch daily_saving_url(@daily_saving), params: { daily_saving: { title: @daily_saving.title } }
    assert_redirected_to daily_saving_url(@daily_saving)
  end

  test "should destroy daily_saving" do
    assert_difference("DailySaving.count", -1) do
      delete daily_saving_url(@daily_saving)
    end

    assert_redirected_to daily_savings_url
  end
end
