require_relative '../lib/conversation'
require_relative '../lib/conversation_repository'

describe ConversationRepository do

  before(:all) do
    @repo = ConversationRepository.new
  end
  
  it 'finds all conversations' do

    conversations = @repo.all

    expect(conversations.length).to eq 4
    expect(conversations.first.maker_id).to eq 1
    expect(conversations.last.maker_id).to eq 4
    
  end

  it 'creates one conversation' do
    conversation = Conversation.new
    conversation.maker_id = 3
    @repo.create(conversation)

    conversations = @repo.all

    expect(conversations.last.maker_id).to eq 3

  end

  it 'finds one conversation' do
    
    conversation = @repo.find(1)
    
    expect(conversation.id).to eq(1)
    expect(conversation.maker_id).to eq(1)
  end

  it 'deletes one conversation' do
    @repo.delete(1)
    conversations = @repo.all
    expect(conversations.length).to eq 3
  end
end