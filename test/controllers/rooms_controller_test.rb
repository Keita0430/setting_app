require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "should get index" do
    log_in_as(@user)
    get rooms_path
    assert_response :success
  end
end
