require "test_helper"

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Child.count", 1 do
      post "/children.json", params: { name: "Test Child", username: "Test123", email: "test_child@test_child.com", password: "password", password_confirmation: "password", birthdate: "01/01/2000", points_available: 0 }
      assert_response 201
    end
  end
end
