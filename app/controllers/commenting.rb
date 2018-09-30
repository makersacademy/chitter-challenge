class Chitter < Sinatra::Base

  get '/comments/:id/new' do
    @peep_id = params[:id]
    erb :comment
  end

  post '/comment/:id/new' do
    @user = current_user
    @peep_id = params[:id]
    Comment.create(comment: params[:comment], user_id: @user.id, peep_id: @peep_id)
    redirect '/'
  end
end
