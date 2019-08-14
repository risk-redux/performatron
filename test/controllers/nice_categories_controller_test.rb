require 'test_helper'

class NiceCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nice_categories_index_url
    assert_response :success
  end

end
