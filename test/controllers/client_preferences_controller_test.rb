require 'test_helper'

class ClientPreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_preference = client_preferences(:one)
  end

  test "should get index" do
    get client_preferences_url
    assert_response :success
  end

  test "should get new" do
    get new_client_preference_url
    assert_response :success
  end

  test "should create client_preference" do
    assert_difference('ClientPreference.count') do
      post client_preferences_url, params: { client_preference: {  } }
    end

    assert_redirected_to client_preference_url(ClientPreference.last)
  end

  test "should show client_preference" do
    get client_preference_url(@client_preference)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_preference_url(@client_preference)
    assert_response :success
  end

  test "should update client_preference" do
    patch client_preference_url(@client_preference), params: { client_preference: {  } }
    assert_redirected_to client_preference_url(@client_preference)
  end

  test "should destroy client_preference" do
    assert_difference('ClientPreference.count', -1) do
      delete client_preference_url(@client_preference)
    end

    assert_redirected_to client_preferences_url
  end
end
