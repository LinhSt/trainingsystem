require 'test_helper'

class UserSubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_subject_create_url
    assert_response :success
  end

end
