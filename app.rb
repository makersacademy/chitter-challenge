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
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/maker_repository'
    also_reload 'lib/conversation_repository'
    also_reload 'lib/peep_repository'
    also_reload 'lib/tag_repository'
  end

  get '/' do
    return redirect('/conversations')
  end

  get '/conversations/:id' do
    makerRepo = MakerRepository.new
    peepRepo = PeepRepository.new
    tagrepo = TagRepository.new
    allPeeps = peepRepo.all
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
    convRepo = ConversationRepository.new
    makerRepo = MakerRepository.new
    peepRepo = PeepRepository.new
    tagrepo = TagRepository.new
    conversations = convRepo.all
    allPeeps = peepRepo.all
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
    convRepo = ConversationRepository.new
    conv = Conversation.new
    conv.maker_id = params[:maker_id]
    convRepo.create(conv)
    convid = convRepo.all.last.id
    peepRepo = PeepRepository.new
    peep = Peep.new
    peep.content = params[:content]
    peep.maker_id = params[:maker_id]
    peep.conversation_id = convid
    peepRepo.create(peep)
    return redirect('/conversations')
  end

  post '/peeps' do
    peepRepo = PeepRepository.new
    peep = Peep.new
    peep.content = params[:content]
    peep.maker_id = params[:maker_id]
    peep.conversation_id = params[:conv_id]
    peepRepo.create(peep)
    return redirect("/conversations/#{params[:conv_id]}")
  end

  private

  def pretty_time(text)
    return DateTime.parse(text).strftime("%k:%M %d/%m/%Y")
  end

end