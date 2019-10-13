class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.reverse_order
    erb :'peeps/peeps'
  end

  post '/peeps' do
    Peep.create(message: params[:text])
    flash[:success] = 'Peep added to Chitter'
    redirect '/'
  end

end
