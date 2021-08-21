require 'bundler'
Bundler.require

configure :test do
  set :database, {
    adapter: 'postgresql', encoding: 'unicode',
    database: ENV['DB_TEST'], pool: 2, username: ENV['DB_USER_TEST'],
    password: ENV['DB_PASSWORD_TEST']
  }
end

configure :production do
  set :database, {
    adapter: 'postgresql', encoding: 'unicode', database: ENV['DB_PRODUCTION'],
    pool: 2, username: ENV['DB_USER_PRODUCTION'],
    password: ENV['DB_PASSWORD_PRODUCTION']
  }
end

require_all 'app'