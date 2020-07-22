require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(username: 'newuser', email: 'newuser@example.com', password: 'password')
     sign_in_as(@user)
  end

  test "get new article form and create article as admin" do
    get new_article_path
    assert_response :success
    assert_difference 'Article.count',1 do
      post articles_path, params: { article: { title: 'New Article Title', description: 'New article description.' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'New Article Title', response.body
    assert_match 'New article description.', response.body
  end
end