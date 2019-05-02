require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get likes_update_url
    assert_response :success
  end

end
