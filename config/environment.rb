# adapted from https://medium.com/@rileythompson/setting-up-a-simple-sinatra-blog-app-db56dda4c280

# get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__)

# require the controller(s)
Dir.glob(File.join(APP_ROOT, "app", "*.rb")).each { |file| require file }

# require the model(s)
Dir.glob(File.join(APP_ROOT, "lib", "*.rb")).each { |file| require file }

# require database configurations
require File.join(APP_ROOT, "config", "database")

# configure Chitter settings
class Chitter < Sinatra::Base
 set :method_override, true
 set :sessions, true
 set :root, APP_ROOT
 set :views, File.join(APP_ROOT, "views")
 set :public_folder, File.join(APP_ROOT, "public")
end