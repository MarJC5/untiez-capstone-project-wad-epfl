export RAILS_SERVE_STATIC_FILES=true

RAILS_ENV=production rake assets:precompile
RAILS_ENV=production RACK_ENV=production NODE_ENV=production bin/webpack


rails server --environment production
