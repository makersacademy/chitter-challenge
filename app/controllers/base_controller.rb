module ChitterApp
  module Routes
    class Base < Sinatra::Base
      set :views, proc { File.join(root, '..', 'views') }

      get '/' do
        'Hello ChitterWeb!'
      end
    end
  end
end
