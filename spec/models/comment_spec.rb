require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'is not valid without a title' do
    comment.body = nil
    expect(comment).to_not be_valid
  end
end
