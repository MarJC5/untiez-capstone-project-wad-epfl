# Capstone project proposal outline - Project overview

SITE URL : [https://untiez.herokuapp.com/](https://untiez.herokuapp.com/)

 - [Application purpose](#application-purpose)
 - [Run the project](#run-the-project)
 - [Front end](#front-end)
 - [Data structures and models](#data-structures-and-models)
 - [Third party services](#third-party-services)
 - [Testing](#testing)
 - [Deployment services](#deployment-services)
 - [Issues](#issues)

## Application purpose

#### Name : untiez

It is based on the verb untie. it means "A change of stress also helps to untie"

##### Slogan

It's time to **untiez** from the routine.


#### Who will use the application?

Everyone who is interesting in travel and make friends.


#### Why it is needed and useful?

The main purpose is to give a point of contact for:
- organize their trip
- meet new travelers before or during a trip
- share travel memories
- found tips for futur trip
- create trip proposal for meet up new people

## Run the project

### Development mode
Follow the step to start a server in **development** mode for the initial configuration:

```
yarn install
rake db:drop db:create db:migrate db:seed (PS: As this is a clone repo, the AWS Key will return an error)
rails server
```

Webpack will load all the stylesheet & javascript at the first run and then auto-update after any change in **app\javascript** folder.


## Front end

All the SCSS is generate by webpack by import the application.scss here -> **app\javascript\packs\application.js**.
The stylesheets structure is inside **app\javascript\stylesheets** folder.

#### JavaScript DOM manipulation

**Rails-UJS**
- Create asych action with AJAX (In the view: Comments submition, like buttons etc...).
The files are inside **app\javascript\ujs** and is import to webpack -> **app\javascript\packs\application.js**.


**JavaScript**
- Manipulate the DOM
Most of the JS used for manipulate the DOM is located here -> **app\javascript\stylesheets\main.js** and import as well in -> **app\javascript\packs\application.js**.


#### CSS frameworks

**[TailwindCss](https://tailwindcss.com/) :**

It is a highly customizable, low-level CSS framework that gives you all of the building blocks you need to build bespoke designs without any annoying opinionated styles you have to fight to override.

- Powerfull for create rapidly and easily responsive elements in the view. (Forms, Card, Grids)
- Webpack config file: **postcss.config.js**


**Atomic Design Methodology**
- Atomic design is a methodology composed of five distinct stages working together to create interface design systems in a more deliberate and hierarchical manner.


**Scss**
- Better stylesheet structure by a clear nested and visual hierarchy
- Creation of @mixin lets you make groups of CSS declarations that you want to reuse throughout your site
- @extend lets you share a set of CSS properties from one selector to another


## Data structures and models

### DATA Structure

#### User
| Attribute       | Type          |
| ----------------|:-------------:|
| firstname       | string        |
| lastname        | string        |
| pseudo          | string        |
| confirmed       | boolean       |
| email           | string        |
| avatar          | string        |
| avatar_upload   | string        |
| role            | string        |
| slug            | string        |
| bio             | text          |
| location        | string        |
| password_digest | string        |

---

#### Comment
| Attribute     | Type          |
| ------------- |:-------------:|
| body          | text          |
| post          | references    |
| user          | references    |

---

#### Post
| Attribute     | Type          |
| ------------- |:-------------:|
| title         | string        |
| body          | text          |
| image         | string        |
| location      | string        |
| departure     | string        |
| user          | references    |
| category      | references    |
| comment       | references    |

---

#### Category   (i.e.: trip proposal, tips & info, photoshoot)                        
| Attribute     | Type          |
| ------------- |:-------------:|
| name          | string        |

---

#### Legal                    
| Attribute     | Type          |
| ------------- |:-------------:|
| title         | string        |
| body          | text          |
| slug          | string        |

---


## Third party services

#### JavaScript libraries outside of those bundled with Ruby on Rails by default.

**[places.js](https://www.npmjs.com/package/places.js/v/1.16.1) :**

[Algolia](https://www.algolia.com/doc/) Places provides a fast, distributed and easy way to use an address search autocomplete JavaScript library on website.

- Code file: **app\javascript\plugins\autocomplete.js**

**[stimulus.js](https://stimulusjs.org/) :**

Stimulus continuously watches the page, kicking in as soon as attributes appear or disappear. It works with any update to the DOM, regardless of whether it comes from a full page load, a Turbolinks page change, or an Ajax request.

- Code file: **app\javascript\controllers\infinite_scroll_controller.js**


#### Ruby gems outside of those bundled with Ruby on Rails by default.

**[Gem carrierwave](https://rubygems.org/gems/carrierwave) :**

Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends.


**[Gem figaro](https://rubygems.org/gems/figaro) :**

Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file


**[Gem fog-aws](https://rubygems.org/gems/fog-aws) :**

This library can be used as a module for fog or as standalone provider to use the Amazon Web Services in applications.


**[Gem pg](https://rubygems.org/gems/pg) :**

It is the Ruby interface to the PostgreSQL RDBMS.


**[Gem redcarpet](https://rubygems.org/gems/redcarpet) :**

A fast, safe and extensible Markdown to (X)HTML parser

More about markdown syntax : [here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

**[Gem friendly_id](https://rubygems.org/gems/friendly_id) :**

 It lets you create pretty URLs and work with human-friendly strings as if they were numeric ids.

 **[Gem mini_magick](https://rubygems.org/gems/mini_magick) :**

 Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick.


**[Gem kaminari](https://rubygems.org/gems/kaminari) :**

Customizable and sophisticated paginator.

- Code file: **app\helpers\application_helper.rb**


**[Gem geocoder](https://rubygems.org/gems/geocoder/versions/1.3.7) :**

Provides object geocoding (by street or IP address), reverse geocoding (coordinates to street address), distance queries for ActiveRecord and Mongoid, result caching, and more.

- Code file: **app\controllers\posts_controller.rb** ligne 48


**[Gem Acts As Votable](https://github.com/ryanto/acts_as_votable):**

Allow any model to be voted on, like/dislike, upvote/downvote, etc. more info [here](https://blog.makersacademy.com/how-to-make-a-dynamic-rails-like-unlike-button-using-the-acts-as-votable-gem-9ab71686ff82)


#### Third party APIs


**[Algolia Places](https://community.algolia.com/places/?utm_medium=social-owned&utm_source=GitHub&utm_campaign=places%20repository):**

It harnesses OpenStreetMap’s impressive open source database of worldwide places.

client-side :
- Turn any **input** into an address autocomplete


**[MapBox JS](https://docs.mapbox.com/mapbox-gl-js/api):**

Mapbox GL JS is a JavaScript library that uses WebGL to render interactive maps from vector tiles and Mapbox styles.

- Code file: **app\javascript\plugins\map.js**

## Testing

Run the following to build test script
```
chmod +x run-test.sh
run-test.sh
```

Open new terminal window and then run:
```
rails test:system
```

## Deployment services

The application is deployed with **Heroku**.
- Easy to push the code from GitHub
- perfect match with ruby project

## Issues

**User edit - Password conflict**
```
# test if a given string contains at least a lowercase letter, a uppercase, a digit and 8+ chars
has_secure_password

validates :password, format: { with:  /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{7,}/, message: I18n.t('user.alert.strong_password') }
```

The validates format for user password force the user to enter the password during each update otherwise it will not validate the change and return the password validation error message.
All admin user cannot update 'registered' info as they don't have the user password.

A Gem like 'Devise' seems more appropriate for manage password users and more.

I have currently remove the validates to avoid the admin update issue.

**Post creation - photoshoot**:
It takes time to upload a picture to S3, I have to found a way to optimize the photo upload rapidity. Or maybe a pro account with more power will help.

**[@fullhuman/postcss-purgecss](https://www.npmjs.com/package/@fullhuman/postcss-purgecss):**
I had to remove this plugging because in Production some of my SCSS has been desabled altough they were added in the exclusion list.
For now I don't found a solution so I decide to implement it later on.


**[MapBox JS](https://docs.mapbox.com/mapbox-gl-js/api):**

The map container is displaying, but no street data are displaying in the container

**Error:**

Uncaught ReferenceError: _typeof is not defined

**Fix:**

// Preventing Babel from transpiling NodeModules packages => config\webpack\environment.js

environment.loaders.delete('nodeModules');
