require 'rails_helper'

RSpec.describe Post, type: :request do
  let(:user) { create :user }
  let(:post) { create(:post, user_id: user.id) }

  before { sign_in(user) }

  it 'edit post' do
    put post_path(id: post.id), params: { post: { title: 'TitleNew', content: 'ContentContentContent', user_id: user.id } }
    expect(post.reload.title).to eq('TitleNew')
    expect(post.reload.content).to eq('ContentContentContent')
  end
end
