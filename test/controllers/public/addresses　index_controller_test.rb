require "test_helper"

class Public::Addresses　indexControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_addresses　index_edit_url
    assert_response :success
  end
end
