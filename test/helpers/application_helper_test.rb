require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,                 "デキ婚斡旋サイト"
    assert_equal full_title("お問い合わせ"), "お問い合わせ | デキ婚斡旋サイト"
  end
end