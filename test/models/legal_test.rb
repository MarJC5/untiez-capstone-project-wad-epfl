require 'test_helper'

class LegalTest < ActiveSupport::TestCase

  test 'Title& body validation should trigger' do
    # test -> presence: true
    refute Legal.new(
      title: '',
      body: ''
    ).save
  end

  test 'Should create legal term' do
    assert Legal.new(
      title: 'Sample',
      body: 'Some text'
    ).save
  end
end
