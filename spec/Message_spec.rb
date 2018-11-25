# require 'chitter'
# require 'time'
# require 'database_helpers'
# require 'user'

# describe Chitter do
# 	describe '.create' do
# 		it 'create a new chitter' do
# 			user = User.create(name: 'test', u_name: 'u_test', email: 'test11@test.com', password: 'test1234')
# 			chitter = Chitter.create(text: 'testing', date: Time.now, user:	user.id)
# 			persisted_data = persisted_data_chitter(id: user.id, table: 'messages')

# 			expect(chitter).to be_a Chitter
# 			expect(chitter.id).to eq persisted_data.first['id']
# 			expect(chitter.text).to eq 'testing'
# 			expect(chitter.user_id).to eq user.id
# 		end
# 	end
# end