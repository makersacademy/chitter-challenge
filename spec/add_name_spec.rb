require './lib/messages'
require 'data_base_helper'



describe Messages do
  it 'adds message to database' do

    message_1 = Messages.add(message: 'first note')
    persisted_data = persisted_data(id: message_1.id)


    expect(message_1).to be_a Messages
    expect(message_1.message).to eq 'first note' 
  end
end