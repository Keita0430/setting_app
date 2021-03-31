require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", review_path
    assert_select "a[href=?]", help_path
    get review_path
    assert_select "title", full_title("口コミ")
    get signup_path
    assert_select "title", full_title("新規登録")
  end
end
