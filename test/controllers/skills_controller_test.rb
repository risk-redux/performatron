require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get skills_index_url
    assert_response :success
  end

  test "should get show" do
    get skills_show_url
    assert_response :success
  end

end
