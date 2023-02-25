require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a content' do
    post.content = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a user' do
    post.user = nil
    expect(post).to_not be_valid
  end
end
