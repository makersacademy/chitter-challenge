require 'sinatra/base'

class Chitter < Sinatra::Base

  post '/comments/:peep_id' do
    if current_user && !params[:comment_text].empty?
      comment = Comment.create(text: params[:comment_text],
                              user_id: current_user.id,
                              peep_id: params[:peep_id])
      redirect '/peeps'
    elsif params[:comment_text]
      flash.keep[:errors] = ["Please enter some text"]
      redirect :'/peeps'
    end
  end

end
