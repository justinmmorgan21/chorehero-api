require "test_helper"

class ParentsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Parent.count", 1 do
      post "/parents.json", params: { username: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response 201
    end
  end

  test "index" do
    get "/parents.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Parent.count, data.length
  end

  test "show" do
    get "/parents/#{Parent.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "username", "email", "children", "rewards"], data.keys
  end
end
