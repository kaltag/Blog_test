require 'rails_helper'

RSpec.describe Comment, type: :request do
  let(:user) { create :user }
  let(:post) { create(:post, user_id: user.id) }

  before { sign_in(user) }

  it 'add comment' do
    expect(Comment.count).to eq 0
    post post_comments_path, params: { comment: { body: 'NewComment', user_id: user.id } }
    expect(Comment.count).to eq 1
  end

  it 'empty title' do
    expect(Post.count).to eq 0
    post posts_path, params: { comment: { body: '', user_id: user.id } }
    expect(Post.count).to eq 0
    expect(response.status).to eq(422)
  end
end
