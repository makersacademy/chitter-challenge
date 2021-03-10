require 'user'

describe User do

    it 'will know the information of a user' do
        user = User.newuser(id: 1, name: 'Maker', email: 'maker@makers.com', username: 'makername', password: 'academy')
        expect(user.name).to eq 'Maker'
        expect(user.email).to eq 'maker@makers.com'
        expect(user.username).to eq 'makername'
        expect(user.password).to eq 'academy'
    end
end