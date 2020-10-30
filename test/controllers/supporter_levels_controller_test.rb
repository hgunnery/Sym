require 'test_helper'

class SupporterLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supporter_level = supporter_levels(:one)
  end

  test "should get index" do
    get supporter_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_supporter_level_url
    assert_response :success
  end

  test "should create supporter_level" do
    assert_difference('SupporterLevel.count') do
      post supporter_levels_url, params: { supporter_level: { amount: @supporter_level.amount, name: @supporter_level.name } }
    end

    assert_redirected_to supporter_level_url(SupporterLevel.last)
  end

  test "should show supporter_level" do
    get supporter_level_url(@supporter_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_supporter_level_url(@supporter_level)
    assert_response :success
  end

  test "should update supporter_level" do
    patch supporter_level_url(@supporter_level), params: { supporter_level: { amount: @supporter_level.amount, name: @supporter_level.name } }
    assert_redirected_to supporter_level_url(@supporter_level)
  end

  test "should destroy supporter_level" do
    assert_difference('SupporterLevel.count', -1) do
      delete supporter_level_url(@supporter_level)
    end

    assert_redirected_to supporter_levels_url
  end
end
