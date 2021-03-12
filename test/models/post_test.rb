require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  setup do
    @post = posts(:one)
    @user = users(:one)
    @category = categories(:one)
  end

  test 'Title validation should trigger' do
    # test -> maximum: 100
    refute Post.new(
      title: 'Post title character limit is 100 and cannot be more. It should refute the bio creation. regarding the model validation.',
      user_id: @user.id,
      category_id: @category.id
    ).save

    # test -> presence: true
    refute Post.new(
      title: '',
      user_id: @user.id,
      category_id: @category.id
    ).save
  end

  test 'belongs_to :user & :category should trigger' do
    # missing user & category
    refute Post.new(
      title: 'Sample'
    ).save
  end

  test 'Should create post' do
    assert Post.new(
      title: 'Sample',
      body: 'Some text',
      user_id: @user.id,
      category_id: @category.id
    ).save
  end

end
