# config.ru
require './app/chitter.rb'

run CHITTER

use Rack::Static,
  :urls => ["/images", "/js", "/stylesheets"],
  :root => "public"
