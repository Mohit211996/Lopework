require 'test_helper'

class StartupTechnologiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @startup_technology = startup_technologies(:one)
  end

  test "should get index" do
    get startup_technologies_url
    assert_response :success
  end

  test "should get new" do
    get new_startup_technology_url
    assert_response :success
  end

  test "should create startup_technology" do
    assert_difference('StartupTechnology.count') do
      post startup_technologies_url, params: { startup_technology: {  } }
    end

    assert_redirected_to startup_technology_url(StartupTechnology.last)
  end

  test "should show startup_technology" do
    get startup_technology_url(@startup_technology)
    assert_response :success
  end

  test "should get edit" do
    get edit_startup_technology_url(@startup_technology)
    assert_response :success
  end

  test "should update startup_technology" do
    patch startup_technology_url(@startup_technology), params: { startup_technology: {  } }
    assert_redirected_to startup_technology_url(@startup_technology)
  end

  test "should destroy startup_technology" do
    assert_difference('StartupTechnology.count', -1) do
      delete startup_technology_url(@startup_technology)
    end

    assert_redirected_to startup_technologies_url
  end
end
