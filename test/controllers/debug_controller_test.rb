require 'test_helper'

class DebugControllerTest < ActionDispatch::IntegrationTest
  test "should get mecab" do
    get debug_mecab_url
    assert_response :success
  end

end
