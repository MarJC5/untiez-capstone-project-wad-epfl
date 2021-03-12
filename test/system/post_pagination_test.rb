require 'application_system_test_case'

class CapybaraTest < ApplicationSystemTestCase

  test 'Index post page should have 6 post visible' do

    # Create new user
    user = User.new(
        firstname: 'Pagination',
        lastname: 'Test',
        pseudo: 'upagi',
        confirmed: false,
        bio: "test",
        role: 'registered',
        avatar: 'samples/avatar-1.png',
        email: 'pagination@untiez.com',
        location: "Switzerland",
        password: 'Password4',
    ).save!

    # Create category
    cat = Category.find_or_create_by(
        name: 'post'
    ).save!

    # Create posts
    7.times do |post|
      Post.new(
        title: "Test pagination - #{post + 1}",
        body: "Lorem ipsum, it's just a sample #{post + 1}",
        image: nil,
        location: nil,
        user_id: 1,
        category_id: 1
      ).save!
    end

    visit(discover_path('en'))
    sleep(1)

    assert page.has_text?("Lorem ipsum, it's just a sample 7")
    assert page.has_text?("Lorem ipsum, it's just a sample 6")
    assert page.has_text?("Lorem ipsum, it's just a sample 5")
    assert page.has_text?("Lorem ipsum, it's just a sample 4")
    assert page.has_text?("Lorem ipsum, it's just a sample 3")
    assert page.has_text?("Lorem ipsum, it's just a sample 2")
    assert page.has_no_text?("Lorem ipsum, it's just a sample 1")

  end

end
