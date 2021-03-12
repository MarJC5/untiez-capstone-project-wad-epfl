# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  Users
User.create!(
    firstname: 'untiez',
    lastname: 'team',
    pseudo: 'untiez',
    confirmed: true,
    email: 'team@untiez.com',
    avatar: 'samples/logo.png',
    role: 'admin',
    bio: "It's time to untiez from the routine.",
    location: "Switzerland",
    password: 'Password1',
)
User.create!(
    firstname: 'Jean-Christio',
    lastname: 'Martin',
    pseudo: 'marjc',
    confirmed: false,
    email: 'j.christio.martin@gmail.com',
    avatar: 'samples/logo.png',
    role: 'registered',
    bio: "I'm a young man from Switzerland who love to travel around the world !",
    location: "Switzerland",
    password: 'Password1',
)
User.create!(
    firstname: 'Epfl',
    lastname: 'Extension',
    pseudo: 'epfl',
    confirmed: false,
    email: 'epfl.extension@epfl.ch',
    avatar: 'samples/avatar-1.png',
    role: 'admin',
    bio: "Based in Lausanne, EPFL is a university whose three missions are education.",
    location: "Switzerland",
    password: 'Password1',
)

# Default categories
Category.create!(
    name: 'post'
)
Category.create!(
    name: 'tips'
)
Category.create!(
    name: 'trip-proposal'
)
Category.create!(
    name: 'photoshoot'
)

# Initial posts
Post.create!(
  title: 'Welcom to Untiez !',
  body: "It's time to untiez from the routine.",
  image: nil,
  location: nil,
  user_id: 1,
  category_id: 1
)

# Initial legals
Legal.create!(
    title: 'Terms',
    body: "empty"
)

Legal.create!(
    title: 'Policy',
    body: "Empty"
)

Legal.create!(
    title: 'Cookies & personal data',
    body: "Empty"
)
