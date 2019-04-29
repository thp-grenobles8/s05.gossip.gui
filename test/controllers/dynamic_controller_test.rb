require 'test_helper'

class DynamicControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get dynamic_welcome_url
    assert_response :success
  end

end
