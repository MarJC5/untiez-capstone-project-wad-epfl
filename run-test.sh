RAILS_ENV=test bundle exec rails db:drop db:create db:migrate
RAILS_ENV=test bundle exec rails db:fixtures:load

RAILS_ENV=test bundle exec rails test
