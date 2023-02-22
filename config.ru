require 'sinatra'
require './app'

configure :development do
  require 'sinatra/reloader'
end

use Rack::Static, :urls => ['/public/styles'], :root => '.'

mime_type :css, 'text/css/'

run Application
