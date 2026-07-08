require "test_helper"

class NobodyControllerTest < ActionDispatch::IntegrationTest
  test "should get access_denied" do
    get nobody_access_denied_url
    assert_response :success
  end

  test "should get login" do
    get nobody_login_url
    assert_response :success
  end

  test "should get logout" do
    get nobody_logout_url
    assert_response :success
  end
end
