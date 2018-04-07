require 'test_helper'

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get order_items_add_url
    assert_response :success
  end

end
