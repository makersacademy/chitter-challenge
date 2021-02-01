require './lib/user'

describe User do 

    describe '.create' do 
        it 'should create a user' do 
        user = User.create(email: 'my_email@email.com', password: 'password123', name: 'Dan T', username: 'ddottyler')
        connection = PG.connect(dbname: 'chitter_test')
        result = connection.query("SELECT * FROM users WHERE userid = #{user.userid};")

        expect(user).to be_a User
        expect(user.userid).to eq result.first['userid']
        expect(user.email).to eq 'my_email@email.com'
     end
    end 

    describe '.find' do 
        it 'returns nil if there is no ID given' do 
            expect(User.find(nil)).to eq nil
        end

        it 'finds a user by ID' do
            user = User.create(email: 'my_email@email.com', password: 'password123', name: 'Dan T', username: 'ddottyler')
            result = User.find(user.userid)
       
            expect(result.userid).to eq user.userid
            expect(result.email).to eq user.email
        end
    end
end
