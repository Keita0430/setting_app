require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Cheers!"
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "お問い合わせ | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "初めての方へ | #{@base_title}"
  end
  
  test "should get review" do
    get review_path
    assert_response :success
    assert_select "title", "口コミ | #{@base_title}"
  end
end