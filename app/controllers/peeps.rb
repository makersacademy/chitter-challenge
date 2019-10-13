class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.reverse_order
    p @peeps.first.message
    p Peep.all.first.message
    erb :'peeps/peeps'
  end

  post '/peeps' do
    Peep.create(message: params[:text])
    flash[:notice] = 'Peep added to Chitter'
    redirect '/'
  end

end
