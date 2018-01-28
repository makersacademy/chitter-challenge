class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peeps.all(:order => [ :message_created.desc ])
    erb :peeps
  end

  get '/peeps/new' do
    erb :peeps_add
  end

  post '/new_peep' do
    Peeps.create(peep_user: params[:peep_user], message: params[:message], message_created: Time.now.to_s)
    redirect '/'
  end


end
