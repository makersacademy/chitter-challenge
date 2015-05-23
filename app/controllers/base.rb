module Chitter
  module Routes
    class Base < Sinatra::Application
      
      set :views, Proc.new { File.join(root, '../views') }
      set :partial_template_engine, :erb
    end
  end
end