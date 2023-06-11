require "test_helper"

class ChatHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chat_histories_show_url
    assert_response :success
  end
end
