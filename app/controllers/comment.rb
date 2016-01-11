class App < Sinatra::Base
  post '/comment/add' do
    if session[:user_id]
      Comment.create(content: params[:comment_content], created_at: Time.now.to_i,
        user_id: session[:user_id], peep_id: params[:peep_id])
      redirect '/peeps'
    else
      redirect '/register'
    end
  end
end
