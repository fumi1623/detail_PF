require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get maps_create_url
    assert_response :success
  end

  test "should get edit" do
    get maps_edit_url
    assert_response :success
  end

end
