# file: config.ru
require './app'
rackup -p '5432'
run Application
