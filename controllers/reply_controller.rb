class ReplyController < Sinatra::Base

  set :views, Proc.new { File.join(File.dirname(__FILE__), '..', "views") }

  register Sinatra::Flash
  enable :sessions


  get '/reply' do
    redirect '/peeps' if params[:peep_id].nil? || session[:user_id].nil?
    @peep = Peep.find_by_id(id: params[:peep_id])
    redirect '/peeps' if @peep.nil?
    erb :reply
  end

end