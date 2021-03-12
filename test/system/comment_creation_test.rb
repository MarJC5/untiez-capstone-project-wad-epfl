require 'application_system_test_case'

class CapybaraTest < ApplicationSystemTestCase

  test 'Create comment' do

    cat = Category.find_or_create_by(
        name: 'post'
    )
    cat.save!

    visit(root_path('en'))
    sleep(1)

    # Create new user
    user = User.new(
        firstname: 'Utest3',
        lastname: 'Test',
        pseudo: 'utest3',
        confirmed: false,
        bio: "test",
        role: 'admin',
        avatar: 'samples/avatar-1.png',
        email: 'comment_creation1@untiez.com',
        location: "Switzerland",
        password: 'Password3',
    )
    user.save!

    user2 = User.new(
        firstname: 'Commentor',
        lastname: 'Test',
        pseudo: 'usercom',
        confirmed: false,
        bio: "test",
        role: 'admin',
        avatar: 'samples/avatar-1.png',
        email: 'comment_creation2@untiez.com',
        location: "Switzerland",
        password: 'Password3',
    )
    user2.save!

    # Login
    click_link('Sign in', match: :first)
    fill_in('email' , :with => 'comment_creation1@untiez.com')
    fill_in('password' , :with => 'Password3')
    find('input[name="commit"]').click
    sleep(1)

    # Post creation
    post = Post.new(
      title: 'Utest3 test comment',
      body: "Utest3 test comment creation in post",
      image: nil,
      location: nil,
      user_id: user.id,
      category_id: cat.id,
    )
    post.save!
    sleep(2)

    # Comment creation
    com = Comment.new(
      body: "Hey I'm a test comment!",
      post_id: post.id,
      user_id: user2.id,
    )
    com.save!

    # Check post & comment in view
    visit(user_path('en', user.id))
    click_link('Read more', match: :first)
    sleep(1)

    assert page.has_content?("Hey I'm a test comment!")

  end

end
