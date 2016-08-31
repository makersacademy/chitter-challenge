class Chitter < Sinatra::Base

  post '/comments' do
    Comment.create(message: params[:message], user_id: current_user.id,
                              peep_id: params[:peep_id])
    redirect '/peeps'
  end
  
end