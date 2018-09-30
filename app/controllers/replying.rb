class Chitter < Sinatra::Base

  get '/reply/:id/new' do
    @peep_id = params[:id]
    erb :reply
  end

  post '/reply/:id/new' do
    @user = current_user
    @peep_id = params[:id]
    Reply.create(message: params[:reply], user_id: @user.id, peep_id: @peep_id)
    redirect '/'
  end
end
