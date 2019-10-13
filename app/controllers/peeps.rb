class Chitter < Sinatra::Base

  post '/peeps' do
    Peep.create(message: params[:text])
    flash[:notice] = 'Peep added to Chitter'
    redirect '/'
  end

end
