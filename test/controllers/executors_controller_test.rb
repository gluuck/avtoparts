require 'test_helper'

class ExecutorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get executors_index_url
    assert_response :success
  end

  test "should get show" do
    get executors_show_url
    assert_response :success
  end

  test "should get new" do
    get executors_new_url
    assert_response :success
  end

  test "should get edit" do
    get executors_edit_url
    assert_response :success
  end

  test "should get create" do
    get executors_create_url
    assert_response :success
  end

  test "should get update" do
    get executors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get executors_destroy_url
    assert_response :success
  end

end
