class Chitter < Sinatra::Base

  get '/message/new' do
    redirect '/feeds/view' unless current_user
    erb :'message/new'
  end

  post '/message' do
    current_user.peeps << Peep.new(message: params[:message])
    current_user.save

    redirect '/feeds/view'
  end


end
