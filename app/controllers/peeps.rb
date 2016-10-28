class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all_in_reverse_order
    erb :'peeps/peeps'
  end

  post '/peeps' do
      if current_user && !params[:peep_text].empty?
          Peep.create(user: current_user,
          text: params[:peep_text],
          timestamp: Time.now)
          redirect to('/peeps')
      elsif params[:peep_text]
        flash.keep[:errors] = "You need to write something."
        redirect :'/peeps'
      end
  end


  post '/responses/:peep_id' do
    if current_user && params[:response_text]
      Response.create(text: params[:response_text],
                      user_id: current_user.id,
                      peep_id: params[:peep_id],
                      timestamp: Time.now)
      redirect to('/peeps')
    elsif !params[:text]
      flash.keep[:errors] = "You need to write something."
      redirect :'/peeps'
    end
  end

end
