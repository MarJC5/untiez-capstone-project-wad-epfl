require 'application_system_test_case'

class CapybaraTest < ApplicationSystemTestCase

  test 'Search user' do

    # Create new user
    user = User.new(
        firstname: 'Search user',
        lastname: 'Test',
        pseudo: 'usearch1',
        confirmed: false,
        bio: "test",
        role: 'admin',
        avatar: 'samples/avatar-1.png',
        email: 'search_term_user1@untiez.com',
        location: "Switzerland",
        password: 'Password2',
    )
    user.save!


    #Search
    visit(search_path(:en, params: {q: 'usearch1'}))
    sleep(1)

    page.has_content?('@usearch1')

  end

  test 'Search post' do

    # Create category
    cat = Category.find_or_create_by(
        name: 'post'
    )
    cat.save!

    # Create new user
    user = User.new(
        firstname: 'Search post',
        lastname: 'Test',
        pseudo: 'utest6',
        confirmed: false,
        bio: "test",
        role: 'admin',
        avatar: 'samples/avatar-1.png',
        email: 'search_term_post@untiez.com',
        location: "Switzerland",
        password: 'Password2',
    )
    user.save!

    # Create post
    post = Post.new(
      title: 'Post search test',
      body: "Lorem ipsum, it's just a sample",
      image: nil,
      location: nil,
      user_id: user.id,
      category_id: cat.id
    )
    post.save!

    sleep(2)

    visit(search_path(:en, params: {q: 'test'}))
    sleep(1)

    page.has_content?('Post search test')

  end

end
