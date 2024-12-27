require "test_helper"

class ParentsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Parent.count", 1 do
      post "/parents.json", params: { username: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response 201
    end
  end
end
