require "test_helper"

class FollowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @following = followings(:one)
  end

  test "should get index" do
    get followings_url, as: :json
    assert_response :success
  end

  test "should create following" do
    assert_difference("Following.count") do
      post followings_url, params: { following: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show following" do
    get following_url(@following), as: :json
    assert_response :success
  end

  test "should update following" do
    patch following_url(@following), params: { following: {  } }, as: :json
    assert_response :success
  end

  test "should destroy following" do
    assert_difference("Following.count", -1) do
      delete following_url(@following), as: :json
    end

    assert_response :no_content
  end
end
