require 'test_helper'

class KnowledgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get knowledges_index_url
    assert_response :success
  end

  test "should get show" do
    get knowledges_show_url
    assert_response :success
  end

end
