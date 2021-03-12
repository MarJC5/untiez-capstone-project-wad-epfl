require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    user = users(:one)

    @user = User.find(user.id)
  end

  test 'Bio validation should trigger' do
    # BIO -> maximum: 100
    @user.bio = 'Untiez bio character limit is 100 and cannot be more. It should refute the bio creation. regarding the model validation.'
    refute @user.save
  end

  test 'Pseudo validation should trigger' do
    # PSEUDO -> maximum: 10
    @user.pseudo = 'PseudoPseudo'
    @user.save
    refute @user.pseudo == 'PseudoPseudo'

    # PSEUDO -> minimum: 3 & not only number
    @user.pseudo = '123'
    refute @user.save
  end

  test "Should create user" do
    assert User.new(
            firstname: "User",
            lastname: "Test",
            pseudo: "user3",
            confirmed: false,
            email: "test_user_sample@test.com",
            avatar: "samples/avatar-3.png",
            role: "admin",
            bio: "Hi I'm User Test",
            location: "Userland 1",
            password: "Password1",
            slug: "user3",
          ).save
  end

  test 'Attributs presence true trigger' do
    refute User.new(
            firstname: '',
            lastname: '',
            pseudo: '',
            confirmed: false,
            email: '',
            avatar: "samples/avatar-3.png",
            role: "admin",
            bio: "Hi I'm User Test",
            location: '',
            password: '',
            slug: ''
          ).save
  end

end
