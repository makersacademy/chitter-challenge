require 'chitter.rb'

describe Chitter do
    it 'returns instanc of class' do
        expect(subject).to be_a Chitter
    end

    describe '#return_users' do
        it 'returns a list of users' do
            users = Chitter.return_users

            expect(users).to include "Kanye"
            expect(users).to include "Kendrick"
            expect(users).to include "Jay Z"
        end
    end
end