require 'sinatra'
require './app'

configure :development do
  require 'sinatra/reloader'
end

use Rack::Static, :urls => ['/styles'], :root => '.'

mime_type :css, 'text/css'

run Application
