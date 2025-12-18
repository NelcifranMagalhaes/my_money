require "test_helper"

class MoneyOutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @money_out = money_outs(:one)
  end

  test "should get index" do
    get money_outs_url
    assert_response :success
  end

  test "should get new" do
    get new_money_out_url
    assert_response :success
  end

  test "should create money_out" do
    assert_difference("MoneyOut.count") do
      post money_outs_url, params: { money_out: { category_id: @money_out.category_id, description: @money_out.description, label: @money_out.label, money_date: @money_out.money_date } }
    end

    assert_redirected_to money_out_url(MoneyOut.last)
  end

  test "should show money_out" do
    get money_out_url(@money_out)
    assert_response :success
  end

  test "should get edit" do
    get edit_money_out_url(@money_out)
    assert_response :success
  end

  test "should update money_out" do
    patch money_out_url(@money_out), params: { money_out: { category_id: @money_out.category_id, description: @money_out.description, label: @money_out.label, money_date: @money_out.money_date } }
    assert_redirected_to money_out_url(@money_out)
  end

  test "should destroy money_out" do
    assert_difference("MoneyOut.count", -1) do
      delete money_out_url(@money_out)
    end

    assert_redirected_to money_outs_url
  end
end
