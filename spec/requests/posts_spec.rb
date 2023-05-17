require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) do
    User.create(
      name: 'Rails',
      photo: 'http://localhost:3000/thursday.png',
      bio: 'Something test',
      postscounter: 10
    )
  end

  let!(:post) do
    Post.create(
      title: 'Ruby',
      text: 'Learn Ruby',
      author: user,
      commentscounter: 10,
      likescounter: 10
    )
  end

  describe 'GET /index' do
    before do
      get "/users/#{user.id}/posts/"
    end

    it 'renders post template' do
      expect(response).to render_template(:index)
    end

    it 'post response body includes correct placeholder text' do
      expect(response.body).to include('list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before do
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'returns success for detail post' do
      expect(response).to have_http_status(200)
    end

    it 'renders post detail template' do
      expect(response).to render_template(:show)
    end

    it 'post detail response body includes correct placeholder text' do
      expect(response.body).to include('Post detail with comments')
    end
  end
end
