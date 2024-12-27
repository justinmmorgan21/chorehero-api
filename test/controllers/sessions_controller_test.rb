require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    post "/parents.json", params: { username: "test_parent", email: "test@test.com", password: "password", password_confirmation: "password" }
    post "/sessions.json", params: { username: "test_parent", password: "password" }
    assert_response 201

    data = JSON.parse(response.body)
    assert_equal ["jwt", "username", "user_id"], data.keys
  end
end
