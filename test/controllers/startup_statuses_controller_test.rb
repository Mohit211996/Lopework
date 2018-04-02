require 'test_helper'

class StartupStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @startup_status = startup_statuses(:one)
  end

  test "should get index" do
    get startup_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_startup_status_url
    assert_response :success
  end

  test "should create startup_status" do
    assert_difference('StartupStatus.count') do
      post startup_statuses_url, params: { startup_status: {  } }
    end

    assert_redirected_to startup_status_url(StartupStatus.last)
  end

  test "should show startup_status" do
    get startup_status_url(@startup_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_startup_status_url(@startup_status)
    assert_response :success
  end

  test "should update startup_status" do
    patch startup_status_url(@startup_status), params: { startup_status: {  } }
    assert_redirected_to startup_status_url(@startup_status)
  end

  test "should destroy startup_status" do
    assert_difference('StartupStatus.count', -1) do
      delete startup_status_url(@startup_status)
    end

    assert_redirected_to startup_statuses_url
  end
end
