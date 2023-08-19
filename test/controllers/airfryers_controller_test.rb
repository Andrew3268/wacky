require "test_helper"

class AirfryersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @airfryer = airfryers(:one)
  end

  test "should get index" do
    get airfryers_url
    assert_response :success
  end

  test "should get new" do
    get new_airfryer_url
    assert_response :success
  end

  test "should create airfryer" do
    assert_difference("Airfryer.count") do
      post airfryers_url, params: { airfryer: { af_title: @airfryer.af_title } }
    end

    assert_redirected_to airfryer_url(Airfryer.last)
  end

  test "should show airfryer" do
    get airfryer_url(@airfryer)
    assert_response :success
  end

  test "should get edit" do
    get edit_airfryer_url(@airfryer)
    assert_response :success
  end

  test "should update airfryer" do
    patch airfryer_url(@airfryer), params: { airfryer: { af_title: @airfryer.af_title } }
    assert_redirected_to airfryer_url(@airfryer)
  end

  test "should destroy airfryer" do
    assert_difference("Airfryer.count", -1) do
      delete airfryer_url(@airfryer)
    end

    assert_redirected_to airfryers_url
  end
end
