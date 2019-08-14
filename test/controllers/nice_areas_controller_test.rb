require 'test_helper'

class NiceAreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nice_areas_index_url
    assert_response :success
  end

end
