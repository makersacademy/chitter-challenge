# in config/environment.rb
# get the path of the root of the app
# assuming that this file is one folder down in config/
APP_ROOT = File.expand_path("..", __dir__)

# require the controller(s)
# says that app.rb is in the root
Dir.glob(File.join(APP_ROOT, "app", "*.rb")).each { |file| require file }

# require the model(s)
# models stored in lib/
Dir.glob(File.join(APP_ROOT, "lib", "*.rb")).each { |file| require file }

# require database configurations
# the database setup files that were just made in config/
require File.join(APP_ROOT, "config", "database")

# configure Chitter settings
# This bit of config could also be done in the main app class definition
# This is monkey-patching onto the main class definition
# I suppose it's neater to move it here
# The public/ folder is where images and stylesheets should be, the last line confirms that location
class Application < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "views")
  set :public_folder, File.join(APP_ROOT, "public")
end
