require "test_helper"

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Child.count", 1 do
      post "/parents.json", params: { username: "Test Parent", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response :created, "Parent creation failed: #{response.body}"

      parent_data = JSON.parse(response.body)
      parent_id = parent_data["id"]
      assert_not_nil parent_id, "Parent ID is nil: #{response.body}"

      post "/sessions.json", params: { username: "Test Parent", password: "password" }
      assert_response 201, "Session creation failed: #{response.body}"

      session_data = JSON.parse(response.body)
      jwt_token = session_data["jwt"]
      assert_not_nil jwt_token, "JWT token is nil: #{response.body}"

      post "/children.json", params: { name: "Test Child", username: "Test123", password: "password", password_confirmation: "password", birthdate: "01/01/2000", points_available: 0, money_banked: 0 },
      headers: { 
        "Authorization" => "Bearer #{jwt_token}"
      },
      as: :json
      assert_response :created, "Child creation failed: #{response.body}"
      child_data = JSON.parse(response.body)
      assert_equal "Test Child", child_data["name"]
      assert_equal "Test123", child_data["username"]
      assert_equal parent_id, child_data["parent_id"]
    end
  end

  test "index" do
    post "/parents.json", params: { username: "Test Parent", email: "test@test.com", password: "password", password_confirmation: "password" }
    assert_response :created, "Parent creation failed: #{response.body}"

    parent_data = JSON.parse(response.body)
    parent_id = parent_data["id"]
    assert_not_nil parent_id, "Parent ID is nil: #{response.body}"

    post "/sessions.json", params: { username: "Test Parent", password: "password" }
    assert_response 201, "Session creation failed: #{response.body}"

    session_data = JSON.parse(response.body)
    jwt_token = session_data["jwt"]
    assert_not_nil jwt_token, "JWT token is nil: #{response.body}"

    post "/children.json", params: { name: "Test Child 1", username: "Test1", password: "password", password_confirmation: "password", birthdate: "01/01/2000", points_available: 0, money_banked: 0 },
    headers: { 
      "Authorization" => "Bearer #{jwt_token}"
    },
    as: :json
    post "/children.json", params: { name: "Test Child 2", username: "Test2", password: "password", password_confirmation: "password", birthdate: "01/01/2000", points_available: 0, money_banked: 0 },
    headers: { 
      "Authorization" => "Bearer #{jwt_token}"
    },
    as: :json

    get "/children.json",
    headers: { 
      "Authorization" => "Bearer #{jwt_token}"
    },
    as: :json
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Child.where(parent_id: parent_id).count, data.length
  end

  test "show" do
    get "/children/#{Child.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "parent_id", "name", "username", "birthdate", "age", "points_available", "money_banked", "chores", "child_chores", "monday_chores", "tuesday_chores", "wednesday_chores", "thursday_chores", "friday_chores", "saturday_chores", "sunday_chores", "chores_done_weekly", "active_chores", "inactive_chores", "used_rewards"], data.keys
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
