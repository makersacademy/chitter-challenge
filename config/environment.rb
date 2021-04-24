require 'bundler'
Bundler.require

configure :development do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'onlyphans', pool: 5, username: 'jasonrowsell'}
end
