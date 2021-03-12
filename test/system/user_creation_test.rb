
require 'application_system_test_case'

class CapybaraTest < ApplicationSystemTestCase

  test 'Registration' do

    visit(root_path('en'))

    refute page.has_content?('Account')
    sleep(1)

    # Create new user
    click_link('Sign up', match: :first)
    fill_in('user_email' , :with => 'registration@untiez.com')
    fill_in('user_firstname'  , :with => 'Utest1')
    fill_in('user_lastname' , :with => 'Team')
    fill_in('address-input' , :with => 'Sion, Valais/Wallis, Suisse')
    fill_in('user_pseudo' , :with => 'utest1')
    fill_in('user_password' , :with => 'Password1')
    fill_in('user_password_validation' , :with => 'Password1')
    find('input[name="commit"]').click
    sleep(1)

    assert page.has_content?('Account')

  end

end
