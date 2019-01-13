require './models/message'

describe Message do

  let!(:message) { Message.create(
  content: "@Wolfy here be dragons")
}


  it 'knows if another user has been tagged' do
    expect(Message.tag?).to eq true
  end

end
