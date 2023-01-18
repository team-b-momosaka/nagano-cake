require "test_helper"

class Admin::OrederDeteileControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_oreder_deteile_update_url
    assert_response :success
  end
end
