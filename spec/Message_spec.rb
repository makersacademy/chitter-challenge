require 'message'
require 'time'
require 'database_helpers'
require 'user'

describe Message do
	describe '.create' do
		it 'create a new chitter' do
			time = Time.now
			user = User.create(name: 'test', u_name: 'u_test', email: 'test11@test.com', password: 'test1234')
			message = Message.create(text: 'testing', m_date: time.strftime("%Y-%m-%d"), user_id: user.id)
			persisted_data = persisted_data_message(id: user.id, table: 'messages')

			expect(message).to be_a Message
			expect(message.id).to eq persisted_data.first['id']
			expect(message.text).to eq 'testing'
			expect(message.user_id).to eq user.id
		end
	end
end