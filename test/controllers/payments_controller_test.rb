require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get payments_new_url
    assert_response :success
  end

  test "should get edit" do
    get payments_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get payments_destroy_url
    assert_response :success
  end

end
