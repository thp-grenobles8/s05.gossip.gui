require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get static_contact_url
    assert_response :success
  end

end
