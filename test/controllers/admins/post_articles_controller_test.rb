require 'test_helper'

class Admins::PostArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_post_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_post_articles_show_url
    assert_response :success
  end

end
