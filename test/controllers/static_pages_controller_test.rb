require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get pay" do
    get :pay
    assert_response :success
  end

  test "should get share" do
    get :share
    assert_response :success
  end

end
