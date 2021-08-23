require 'bundler'
Bundler.require

configure :test do
  set :database, {
    adapter: 'postgresql',
    database: 'chitter_test'
  }
end

configure :production do
  set :database, {
    adapter: 'postgresql',
    database: 'chitter'
  }
end

require_all 'app'
