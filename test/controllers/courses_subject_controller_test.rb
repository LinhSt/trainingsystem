require 'test_helper'

class CoursesSubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get courses_subject_index_url
    assert_response :success
  end

  test "should get new" do
    get courses_subject_new_url
    assert_response :success
  end

  test "should get create" do
    get courses_subject_create_url
    assert_response :success
  end

  test "should get update" do
    get courses_subject_update_url
    assert_response :success
  end

  test "should get edit" do
    get courses_subject_edit_url
    assert_response :success
  end

  test "should get show" do
    get courses_subject_show_url
    assert_response :success
  end

  test "should get destroy" do
    get courses_subject_destroy_url
    assert_response :success
  end

end
