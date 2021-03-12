require 'application_system_test_case'

class CapybaraTest < ApplicationSystemTestCase

  test 'Admin view' do

    visit(root_path('en'))
    sleep(1)

    # Create new user
    admin = User.new(
        firstname: 'Uadmin',
        lastname: 'Test',
        pseudo: 'uadmin',
        confirmed: false,
        bio: "test",
        role: 'admin',
        avatar: 'samples/avatar-1.png',
        email: 'admin@untiez.com',
        location: "Switzerland",
        password: 'Password4',
    )
    admin.save!

    user = User.new(
        firstname: 'URegistered',
        lastname: 'Test',
        pseudo: 'uregis',
        confirmed: false,
        bio: "test",
        role: 'registered',
        avatar: 'samples/avatar-1.png',
        email: 'registered@untiez.com',
        location: "Switzerland",
        password: 'Password4',
    )
    user.save!

    # Login
    click_link('Sign in', match: :first)
    fill_in('email' , :with => 'admin@untiez.com')
    fill_in('password' , :with => 'Password4')
    find('input[name="commit"]').click
    sleep(1)

    # Check admin panel
    assert page.has_content?("admin - panel")
    assert page.has_content?("Legal")
    assert page.has_content?("Styleguide")

    visit(user_path('en', user.id))
    assert page.has_content?("Edit")
    find('a', text: 'Edit').click
    assert page.has_content?("Delete user account")

  end

  test 'User view' do

    visit(root_path('en'))
    sleep(1)

    # Create new user

    user = User.new(
        firstname: 'URegistered2',
        lastname: 'Test',
        pseudo: 'uregis2',
        confirmed: false,
        bio: "test",
        role: 'registered',
        avatar: 'samples/avatar-1.png',
        email: 'registered2@untiez.com',
        location: "Switzerland",
        password: 'Password4',
    )
    user.save!

    user2 = User.new(
        firstname: 'URegistered3',
        lastname: 'Test',
        pseudo: 'uregis3',
        confirmed: false,
        bio: "test",
        role: 'registered',
        avatar: 'samples/avatar-1.png',
        email: 'registered3@untiez.com',
        location: "Switzerland",
        password: 'Password4',
    )
    user2.save!

    # Login
    click_link('Sign in', match: :first)
    fill_in('email' , :with => 'registered2@untiez.com')
    fill_in('password' , :with => 'Password4')
    find('input[name="commit"]').click
    sleep(1)

    # Check admin panel
    refute page.has_content?("admin - panel")
    refute page.has_content?("Legal")
    refute page.has_content?("Styleguide")

    # Check if user can edit itself
    visit(user_path('en', user.id))
    assert page.has_content?("Edit")
    find('a', text: 'Edit').click
    assert page.has_content?("Delete user account")

    # Check if user can edit other users
    visit(user_path('en', user2.id))
    refute page.has_content?("Edit")

  end

end
