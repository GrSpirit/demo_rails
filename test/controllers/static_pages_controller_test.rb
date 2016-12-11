require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@base_title = "Demo App"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
  	get about_path
  	assert_response :success
  	assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
  	get contact_url
  	assert_response :success
  	assert_select "title", "Contact | #{@base_title}"
  end

end
