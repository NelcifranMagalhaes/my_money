require "test_helper"

class MoneyInsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @money_in = money_ins(:one)
  end

  test "should get index" do
    get money_ins_url
    assert_response :success
  end

  test "should get new" do
    get new_money_in_url
    assert_response :success
  end

  test "should create money_in" do
    assert_difference("MoneyIn.count") do
      post money_ins_url, params: { money_in: { category_id: @money_in.category_id, description: @money_in.description, label: @money_in.label, money_date: @money_in.money_date } }
    end

    assert_redirected_to money_in_url(MoneyIn.last)
  end

  test "should show money_in" do
    get money_in_url(@money_in)
    assert_response :success
  end

  test "should get edit" do
    get edit_money_in_url(@money_in)
    assert_response :success
  end

  test "should update money_in" do
    patch money_in_url(@money_in), params: { money_in: { category_id: @money_in.category_id, description: @money_in.description, label: @money_in.label, money_date: @money_in.money_date } }
    assert_redirected_to money_in_url(@money_in)
  end

  test "should destroy money_in" do
    assert_difference("MoneyIn.count", -1) do
      delete money_in_url(@money_in)
    end

    assert_redirected_to money_ins_url
  end
end
