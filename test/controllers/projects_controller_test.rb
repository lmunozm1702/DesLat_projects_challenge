require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get projects_all_url
    assert_response :success
  end

  test "should get new" do
    get projects_new_url
    assert_response :success
  end

  test "should get created" do
    get projects_created_url
    assert_response :success
  end
end
