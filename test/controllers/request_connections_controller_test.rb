require 'test_helper'

class RequestConnectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_connection = request_connections(:one)
  end

  test "should get index" do
    get request_connections_url
    assert_response :success
  end

  test "should get new" do
    get new_request_connection_url
    assert_response :success
  end

  test "should create request_connection" do
    assert_difference('RequestConnection.count') do
      post request_connections_url, params: { request_connection: {  } }
    end

    assert_redirected_to request_connection_url(RequestConnection.last)
  end

  test "should show request_connection" do
    get request_connection_url(@request_connection)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_connection_url(@request_connection)
    assert_response :success
  end

  test "should update request_connection" do
    patch request_connection_url(@request_connection), params: { request_connection: {  } }
    assert_redirected_to request_connection_url(@request_connection)
  end

  test "should destroy request_connection" do
    assert_difference('RequestConnection.count', -1) do
      delete request_connection_url(@request_connection)
    end

    assert_redirected_to request_connections_url
  end
end
