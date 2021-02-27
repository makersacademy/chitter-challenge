require 'details'

describe Details do 

    describe '#self.create' do
        it 'stores the signup details on the chitter database' do
            Details.create(email: 'rafswid@icloud.com', password: 'cabbage', name: 'Raf Swiderski', username: 'rafswid')
            details = Details.all
            expect(details.length).to eq 1
            expect(details.first).to be_a Details
            expect(details.email).to eq 'rafswid@icloud.com'
            expect(details.first.password).to eq 'cabbage'
            expect(details.first.name).to eq 'Raf Swiderski'
            expect(details.first.username).to eq 'rafswid'
        end
    end
end
