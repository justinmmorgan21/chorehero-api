require "test_helper"

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Child.count", 1 do
      # parent = Parent.create(username: "test", email: "test@test.com", password: "password", password_confirmation: "password")
      post "/parents.json", params: { username: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response :created, "Parent creation failed: #{response.body}"

      parent_data = JSON.parse(response.body)
      parent_id = parent_data["id"]
      assert_not_nil parent_id, "Parent ID is nil: #{response.body}"

      post "/children.json", params: { parent_id: parent_id, name: "Test Child", username: "Test123", email: "test_child@test_child.com", password: "password", password_confirmation: "password", birthdate: "01/01/2000", points_available: 0 }
      assert_response :created, "Child creation failed: #{response.body}"
    end
  end
end
