require 'hobbit'
require 'hobbit/contrib'
require 'data_mapper'

require_relative 'custom-hobbit'
require_relative 'data_mapper_setup'

class Server < Hobbit::Base
  include Hobbit::Mote
  include Hobbit::Session

  # Currently having a problem, curious how .erb is different.
  # In my index file, if I haven't passed in the param of a
  # variable I'm using, it throws an undefined local variable message,
  # instead of that variable just being nil.
  # Does erb allow this? I don't remember.
  # Current workaround means that for every page render, I have to
  # pass in all used local variables, and give them a nil value if unused.

  # However I suppose I would eventually always be passing in the user
  # from the session...

  get '/' do
    render 'index', peeps: Peep.all, user: nil
  end

  get '/users/new' do
    render 'usercreation'
  end

  post '/users' do
    me = ChatterUser.create(name: params[:name], email: params[:email], creation_date: Time.now)
    render 'index', user: me, peeps: Peep.all
    # Eventually will be using
    # redirect '/'
  end


end
