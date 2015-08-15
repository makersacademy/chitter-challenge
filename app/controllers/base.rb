module ChitterModule
  module Routes
    class Base < Sinatra::Base

      set :views, proc { File.join(root,'../..','views') }

    end
  end
end