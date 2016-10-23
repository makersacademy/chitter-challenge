class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  post '/peeps' do
      if current_user && !params[:text].empty?
          Peep.create(user: current_user,
          text: params[:text],
          timestamp: Time.now)
          redirect to('/peeps')
      elsif params[:text]
        flash.keep[:errors] = "You need to write something."
      end
  end


  post '/responses/:peep_id' do
    if current_user && params[:text]
      Response.create(text: params[:text],
                      user_id: current_user.id,
                      peep_id: params[:peep_id],
                      timestamp: Time.now)
      redirect '/peeps'
    elsif !params[:response_text]
      flash.keep[:errors] = "You need to write something."
      redirect :'/peeps'
    end
  end

end
