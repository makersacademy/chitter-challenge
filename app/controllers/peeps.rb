class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(order: [ :time_created.desc ])
    erb :'peeps/index'
  end

  post '/peeps' do
    current_user.peeps.create( time_created: Time.new, message: params[:message] )
    redirect '/'
  end

end
