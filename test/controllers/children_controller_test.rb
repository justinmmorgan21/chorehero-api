require "test_helper"

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Child.count", 1 do
      post "/parents.json", params: { username: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response :created, "Parent creation failed: #{response.body}"

      parent_data = JSON.parse(response.body)
      parent_id = parent_data["id"]
      assert_not_nil parent_id, "Parent ID is nil: #{response.body}"

      post "/children.json", params: { parent_id: parent_id, name: "Test Child", username: "Test123", email: "test_child@test_child.com", password: "password", password_confirmation: "password", birthdate: "01/01/2000", points_available: 0 }
      assert_response :created, "Child creation failed: #{response.body}"
    end
  end

  test "index" do
    get "/children.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Child.count, data.length
  end

  test "show" do
    get "/children/#{Child.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "parent_id", "name", "username", "birthdate", "points_available"], data.keys
  end

  test "update" do
    # Ensure a unique username for the test
    @child = Child.create!(
      parent_id: Parent.first.id,
      name: "Initial Name",
      username: "UniqueUsername",
      password: "password",
      password_confirmation: "password",
      birthdate: "2000-01-01",
      points_available: 0
    )
    patch "/children/#{@child.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

end
