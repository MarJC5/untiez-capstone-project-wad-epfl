require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test 'Name validation should trigger' do
    # test -> presence: true
    refute Category.new(
      name: ''
    ).save
  end

  test 'Should create category' do
    assert Category.new(
      name: 'Sample'
    ).save
  end

end
