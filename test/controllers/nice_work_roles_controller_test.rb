require 'test_helper'

class NiceWorkRolesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nice_work_roles_index_url
    assert_response :success
  end

end
