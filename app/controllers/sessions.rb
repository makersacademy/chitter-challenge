


class Chitter < Sinatra::Base

  get "/session/new" do
    erb :'session/new'
  end

  post "/session" do
    # logic:
    # params[email].pass authenticate
    # look at how to authenticate a user. Then extract
    # into a helper.
    redirect('/peep/index') # can I redirect to a diff
    # controller
  end

end
