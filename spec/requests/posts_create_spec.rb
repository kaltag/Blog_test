require 'rails_helper'

RSpec.describe Post, type: :request do
  let(:user) { create :user }
  before { sign_in(user) }

  it 'add post' do
    expect(Post.count).to eq 0
    post posts_path, params: { post: { title: 'Title', content: 'ContentContentContent', user_id: user.id } }
    expect(Post.count).to eq 1
  end

  it 'empty title' do
    expect(Post.count).to eq 0
    post posts_path, params: { post: { title: '', content: 'ContentContentContent', user_id: user.id } }
    expect(Post.count).to eq 0
    expect(response.status).to eq(422)
  end

  it 'empty commcontentent' do
    expect(Post.count).to eq 0
    post posts_path, params: { post: { title: 'Title', content: '', user_id: user.id } }
    expect(Post.count).to eq 0
    expect(response.status).to eq(422)
  end

  it 'add image' do
    expect(Post.count).to eq 0
    post posts_path, params: { post: { title: 'Title', content: 'ContentContentContent', user_id: user.id, images: [Rack::Test::UploadedFile.new('./app/assets/images/Spanish.jpg', 'image/jpeg')] } }
    expect(Post.count).to eq 1
  end
end
