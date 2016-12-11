require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "full title helper" do
  	assert_equal full_title,					"Demo App"
  	assert_equal full_title("Help"),	"Help | Demo App"
  end
end
