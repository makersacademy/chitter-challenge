require 'sinatra'

module Application
  module Routes
    class Base < Sinatra::Base
      set :views, proc { File.join(root, '..', 'views') }

      #run! if app_file == $0

    end
  end
end
