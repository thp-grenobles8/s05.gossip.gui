require 'test_helper'

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get gossip" do
    get show_gossip_url
    assert_response :success
  end

end
