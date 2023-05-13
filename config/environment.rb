# Not really clear on what this file does

# defines the root path for the project (or APP) folder 
APP_ROOT = File.expand_path("..", __dir__)

# require the controller (app.rb)
# says that app.rb is in the root
Dir.glob(File.join(APP_ROOT, "app", "*.rb")).each { |file| require file }

 # require the model(s)
 # models stored in lib/
Dir.glob(File.join(APP_ROOT, "lib", "*.rb")).each { |file| require file }

# require database configurations
# the database setup files are in config/
require File.join(APP_ROOT, "config", "database")

# configure Application settings

class Application < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, “views”)
  set :public_folder, File.join(APP_ROOT, “public”)
end
