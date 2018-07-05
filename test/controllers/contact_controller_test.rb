require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get contact_name_url
    assert_response :success
  end

  test "should get surname" do
    get contact_surname_url
    assert_response :success
  end

  test "should get email" do
    get contact_email_url
    assert_response :success
  end

  test "should get phone" do
    get contact_phone_url
    assert_response :success
  end

  test "should get user_id:integer" do
    get contact_user_id:integer_url
    assert_response :success
  end

  test "should get optional:text" do
    get contact_optional:text_url
    assert_response :success
  end

end
