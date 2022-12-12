require "test_helper"

class Public::AddresesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_addreses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_addreses_edit_url
    assert_response :success
  end
end
