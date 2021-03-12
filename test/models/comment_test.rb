require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  setup do
    @post = posts(:one)
    @user = users(:one)
  end

  test 'Body validation should trigger' do
    # test -> presence: true
    refute Comment.new(
      body: '',
      user_id: @user.id,
      post_id: @post.id
    ).save
  end

  test 'belongs_to :user & :post should trigger' do
    refute Comment.new(
      body: 'Some text',
    ).save
  end

  test 'Should create comment' do
    assert Comment.new(
      body: 'Some text',
      user_id: @user.id,
      post_id: @post.id
    ).save
  end
end
