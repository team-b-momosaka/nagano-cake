require "test_helper"

class Public::Addressesã€€indexControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_addressesã€€index_edit_url
    assert_response :success
  end
end
