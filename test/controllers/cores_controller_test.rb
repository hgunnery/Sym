require 'test_helper'

class CoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @core = cores(:one)
  end

  test "should get index" do
    get cores_url
    assert_response :success
  end

  test "should get new" do
    get new_core_url
    assert_response :success
  end

  test "should create core" do
    assert_difference('Core.count') do
      post cores_url, params: { core: { homepage_content: @core.homepage_content, homepage_image: @core.homepage_image, homepage_published: @core.homepage_published } }
    end

    assert_redirected_to core_url(Core.last)
  end

  test "should show core" do
    get core_url(@core)
    assert_response :success
  end

  test "should get edit" do
    get edit_core_url(@core)
    assert_response :success
  end

  test "should update core" do
    patch core_url(@core), params: { core: { homepage_content: @core.homepage_content, homepage_image: @core.homepage_image, homepage_published: @core.homepage_published } }
    assert_redirected_to core_url(@core)
  end

  test "should destroy core" do
    assert_difference('Core.count', -1) do
      delete core_url(@core)
    end

    assert_redirected_to cores_url
  end
end
