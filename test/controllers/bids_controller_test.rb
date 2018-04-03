require 'test_helper'

class BidsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  setup do
    @bid = bids(:one)
  end

  test "should get index" do
    get bids_url
    assert_response :success
  end

  test "should get new" do
    get new_bid_url
    assert_response :success
  end

  test "should create bid" do
    assert_difference('Bid.count') do
      post bids_url, params: { bid: {  } }
    end

    assert_redirected_to bid_url(Bid.last)
  end

  test "should show bid" do
    get bid_url(@bid)
    assert_response :success
  end

  test "should get edit" do
    get edit_bid_url(@bid)
    assert_response :success
  end

  test "should update bid" do
    patch bid_url(@bid), params: { bid: {  } }
    assert_redirected_to bid_url(@bid)
  end

  test "should destroy bid" do
    assert_difference('Bid.count', -1) do
      delete bid_url(@bid)
    end

    assert_redirected_to bids_url
  end
>>>>>>> f1590d1cd206c8f31defc2ead3109a7cffc1baac
end
