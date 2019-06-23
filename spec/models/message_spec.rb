require './lib/models/message'

RSpec.describe Message do

  describe '#.create' do
    it 'create a row with id, message' do
      user = User.create(email: 'nnn@mail.com', password: 'ccffrr', name: 'name', user_name: 'username')
      Message.create(text: 'first message') #, user_id: user.id)
      message = Message.all[0]

      expect(message.id).not_to be(nil)
      expect(message.text).to eq 'first message'
      # expect(message.user_id).to eq user.id
    end

    it 'record the timre of creation' do
      user = User.create(email: 'nnn@mail.com', password: 'ccffrr', name: 'name', user_name: 'username')
      message = Message.create(text: 'first message') #, user_id: user.id)
      message_time = message.created_at.strftime("%Y-%m-%d %H:%M")
      time = Time.now.strftime("%Y-%m-%d %H:%M")

      expect(message_time).to eq(time)
    end
  end
end