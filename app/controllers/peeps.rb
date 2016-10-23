class ChitterChallenge < Sinatra::Base

  get '/' do
    "Hello ChitterChallenge World!!!"
    redirect '/peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    #Name will default to logged_in user name. It won't be editable.
    if params['name'].empty?
      p "hello".inspect
      flash[:notice] = 'You need to be logged in to peep.'
      redirect '/sessions/new'
    end

    Peep.create(name: params['name'], message: params['message'] )
    redirect '/peeps'

  end

end
