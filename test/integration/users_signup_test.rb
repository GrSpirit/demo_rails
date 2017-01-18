require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @params = { user: { name: "Test User",
                        email: "test@example.com",
                        password: "foobar",
                        password_confirmation: "foobar" } }
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                        email: "user@invalid",
                                        password: "foo",
                                        password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: @params
    end
    user = User.find_by_email(@params[:user][:email])
    assert_not_nil user
    assert_not user.activated?
    assert_redirected_to root_url
    follow_redirect!
    #assert_template 'users/show'
    #assert_not_empty flash
    #assert is_logged_in?
  end
end
