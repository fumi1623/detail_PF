require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_page" do
    get users_my_page_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get quite" do
    get users_quite_url
    assert_response :success
  end

  test "should get out" do
    get users_out_url
    assert_response :success
  end

end
