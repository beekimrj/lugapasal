require 'test_helper'

class DressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dresses_index_url
    assert_response :success
  end

  test "should get create" do
    get dresses_create_url
    assert_response :success
  end

  test "should get show" do
    get dresses_show_url
    assert_response :success
  end

  test "should get update" do
    get dresses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dresses_destroy_url
    assert_response :success
  end

end
