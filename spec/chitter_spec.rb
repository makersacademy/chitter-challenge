require 'chitter'
describe Chitter do

  context 'I want to post a message (peep) to chitter' do

    it 'checks the Chitter .show_all_messages returns an array of messages' do
      messages = described_class.show_all_messages
      expect(messages.first.message).to eq 'Lovely Stuff 3'
      expect(messages.last.message).to eq 'Lovely Stuff'
    end

  end

  context 'I want to be able to reply to peoples messages' do

    it 'confirms data added was correct' do
      valid_user = PGDatabase.con.exec_params("INSERT INTO users (user_name, email, password) VALUES ($1,$2,$3) RETURNING *;", ['admin', 'admin@admin.com' , 'password']).first
      valid_message = PGDatabase.create_message(user_id: valid_user['id'], message: 'testing reply input')
      reply = Chitter.create_reply(user_id: valid_user['id'], message_id: valid_message[0].id, message: 'This is a reply').first
      check_stored = PGDatabase.con.exec_params("SELECT * FROM reply WHERE id = $1",[reply.id]).first

      expect(reply).to be_a Reply
      expect(reply.id).to eq check_stored['id']
      expect(reply.message).to eq 'This is a reply'
    end

  end

end

      # user = PGDatabase.con.exec_params("INSERT INTO users (user_name, email, password) VALUES ($1,$2,$3) RETURNING *;", ['admin', 'admin@admin.com' , 'password']).first
      # instance = PGDatabase.create_message(user_id: user["id"], message:'test').first
      # check_stored = select_all_from_message(id: instance.id) 

      # expect(instance).to be_a Message
      # expect(instance.id).to eq check_stored['id']
      # expect(instance.message).to eq 'test'