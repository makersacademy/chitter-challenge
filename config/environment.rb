# get the path of the root of the app
# assuming that this file is one folder down in config
APP_ROOT = File.expand_path("..", __dir__)

# require the controllers
Dir.glob(File.join(APP_ROOT, "app", "*.rb")).each { |file| require file }

# require the models
Dir.glob(File.join(APP_ROOT, "lib", "*.rb")).each { |file| require file }

# require database configurations
# the database setup files that were just made in config/
require File.join(APP_ROOT, "config", "database")

class Chitter < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "views")
  set :public_folder, File.join(APP_ROOT, "public")
end