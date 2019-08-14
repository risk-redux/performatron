require 'test_helper'

class AbilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get abilities_index_url
    assert_response :success
  end

  test "should get show" do
    get abilities_show_url
    assert_response :success
  end

end
