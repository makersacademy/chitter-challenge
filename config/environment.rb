require 'bundler'
Bundler.require

if ENV['RACK_ENV'] == 'test'
  configure :development do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'onlyphans_test', pool: 5, username: 'jasonrowsell'}
  end
else
  configure :development do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'onlyphans', pool: 5, username: 'jasonrowsell'}
  end
end