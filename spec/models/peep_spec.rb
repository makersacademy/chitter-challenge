describe Peep do
    let!(:user) do
        User.create(email: 'michael@jackson.com',
                    name: 'Michael Jackson',
                    user_name: 'mj',
                    password: 'password',
                    password_confirmation: 'password')
    end
    
    let!(:peep) do
        Peep.create(body: 'This is a peep')
    end
    
    before do
        user.peeps << peep
        user.save
    end
    
    it 'can return the creators name' do
        expect(peep.name).to eq "Michael Jackson"
    end
    
    it 'can return the creators user_name' do
        expect(peep.user_name).to eq "mj"
    end
end