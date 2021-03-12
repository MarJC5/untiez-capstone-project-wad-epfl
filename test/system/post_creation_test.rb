require 'application_system_test_case'

class CapybaraTest < ApplicationSystemTestCase

  test 'Create post' do

    # Create category
    cat = Category.find_or_create_by(
        name: 'post'
    )
    cat.save!


    visit(root_path('en'))
    sleep(1)

    refute page.has_content?('Account')

    # Create new user
    user = User.new(
        firstname: 'Utest2',
        lastname: 'Test',
        pseudo: 'utest2',
        confirmed: false,
        bio: "test",
        role: 'admin',
        avatar: 'samples/avatar-1.png',
        email: 'post_creation@untiez.com',
        location: "Switzerland",
        password: 'Password2',
    )
    user.save!

    # Login
    click_link('Sign in', match: :first)
    fill_in('email' , :with => 'post_creation@untiez.com')
    fill_in('password' , :with => 'Password2')
    find('input[name="commit"]').click
    sleep(1)

    assert page.has_content?('Account')

    # Create post
    post = Post.new(
      title: 'Utest2 test post creation',
      body: "Lorem ipsum, it's just a sample",
      image: nil,
      location: nil,
      user_id: user.id,
      category_id: cat.id
    )
    post.save!
    sleep(2)

    # Check post in view
    click_link('Account', match: :first)
    sleep(1)

    assert page.has_content?("Utest2 test post creation")
    click_link("Read more", match: :first)
    assert page.has_content?("Utest2 test post creation")

  end

end
