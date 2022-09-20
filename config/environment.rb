APP_ROOT = File.expand_path("..", __dir__)

Dir.glob(File.join(APP_ROOT, "app", "*.rb")).each { |file| require file }

Dir.glob(File.join(APP_ROOT, "lib", "*.rb")).each { |file| require file }

require File.join(APP_ROOT, "config", "database")

class Chitter < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "views")
  set :public_folder, File.join(APP_ROOT, "public")
 end