class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end

  post '/peeps' do
    current_user.peeps.create(message: params[:message])
    redirect '/peeps'
  end
  
end