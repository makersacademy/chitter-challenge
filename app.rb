# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/maker_repository'
require_relative 'lib/conversation_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/tag_repository'

require 'date'

DatabaseConnection.connect

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/maker_repository'
    also_reload 'lib/conversation_repository'
    also_reload 'lib/peep_repository'
    also_reload 'lib/tag_repository'
  end


  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    maker = MakerRepository.new.login(email,password)

    if maker != nil
      # Set the user ID in session
      session[:maker_id] = maker.id
      session[:username] = maker.username
      return redirect('/')
    else
      return erb(:login_fail)
    end
  end

  get '/logout' do
    session.clear
    return redirect('/')
  end


  get '/register' do
    return erb(:register)
  end

  post '/register' do
    temp_maker = Maker.new
    temp_maker.name = params[:name]
    temp_maker.username = params[:username]
    temp_maker.email = params[:email]
    temp_maker.password = params[:password]

    maker = MakerRepository.new.create(temp_maker)
    if maker != nil
      # Set the user ID in session
      session[:maker_id] = maker.id
      session[:username] = maker.username
      return redirect('/')
    else
      return erb(:register_fail)
    end
  end


  get '/' do
    return redirect('/conversations')
  end

  get '/conversations/:id' do
    makerRepo = MakerRepository.new
    allPeeps = PeepRepository.new.all
    @makers = []
    @peeps = allPeeps.select do |peep|
      peep.conversation_id == params[:id].to_i
    end
    @peeps.each do |peep|
      peep.created_datetime = pretty_time(peep.created_datetime)
      @makers << makerRepo.find(peep.maker_id)
    end
    return erb(:conversation)
  end

  get '/conversations' do
    makerRepo = MakerRepository.new
    conversations = ConversationRepository.new.all
    allPeeps = PeepRepository.new.all
    @peeps = []
    @makers = []
    conversations.each do |conv|
      @peeps << allPeeps.select do |peep|
        peep.conversation_id == conv.id
      end.first
      @makers << makerRepo.find(conv.maker_id)
    end
    @peeps.each do |peep|
      peep.created_datetime = pretty_time(peep.created_datetime)
    end
    @peeps.reverse!
    @makers.reverse!
    return erb(:conversations)
  end

  post '/conversations' do
    conv = Conversation.new
    conv.maker_id = session[:maker_id]
    convid = ConversationRepository.new.create(conv)
    peep = Peep.new
    peep.content = params[:content]
    peep.maker_id = session[:maker_id]
    peep.conversation_id = convid
    PeepRepository.new.create(peep)
    return redirect('/')
  end

  post '/peeps' do
    peep = Peep.new
    peep.content = params[:content]
    peep.maker_id = session[:maker_id]
    peep.conversation_id = params[:conv_id]
    PeepRepository.new.create(peep)
    return redirect("/conversations/#{params[:conv_id]}")
  end

  private

  def pretty_time(text)
    return DateTime.parse(text).strftime("%k:%M %d/%m/%Y")
  end

  def logged_in?
    return session[:maker_id] != nil
  end

end