require 'application_system_test_case'

class CapybaraTest < ApplicationSystemTestCase

  test 'Ensure user enter password for update account' do

    user = User.new(
        firstname: 'EditUser',
        lastname: 'Test',
        pseudo: 'uedit1',
        confirmed: false,
        bio: "test",
        role: 'registered',
        avatar: 'samples/avatar-1.png',
        email: 'uedit1@untiez.com',
        location: "Switzerland",
        password: 'Password4',
        slug:'uedit1',
    )
    user.save!

    visit(root_path(:en))
    sleep(1)

    # Login
    click_link('Sign in', match: :first)
    fill_in('email' , :with => user.email)
    fill_in('password' , :with => user.password)
    find('input[name="commit"]').click
    sleep(1)

    # Check if Update button is hidden
    visit(user_path(:en, user))
    click_link('Edit profile', match: :first)
    refute page.has_text?("Update")
    sleep(1)

    fill_in('user_password' , :with => 'Password2')
    fill_in('user_password_validation' , :with => 'Password2')
    sleep(2)

    find('.form-btn-validation').click
    assert user_path(:en, user)

  end

end
