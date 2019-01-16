require 'user_mentioned'
require 'user'

describe UsersMentioned  do

    let(:dummy_message){ 'theres a mouse in the house @bob' }
    let(:second_dummy_message){ '@gill theres a mouse in the house @bob' }
    ## use extend not include for tesing this way 
    let(:dummy_class) { Class.new { extend UsersMentioned } }
 
    it 'returns the users name' do 
        expect(dummy_class.find_names(dummy_message)).to eql(['bob'])
    end

    it 'it can return multiple user names' do 
        expect(dummy_class.find_names(second_dummy_message)).to eql(['gill','bob'])
    end

    context 'checking against users' do
        let(:names) { ['bob'] }
        let(:user){ double }

        it 'should be able to validate if these are real users' do 
            allow(user).to receive(:first).and_return('bob')
            expect(dummy_class.validate_names(names, user)).to eql(['bob'])
        end

        it 'should be able to validate if these are real users - multiple' do 
            allow(user).to receive(:first).and_return('bob', 'jack')
            expect(dummy_class.validate_names(names, user)).to eql(['bob'])
            expect(dummy_class.validate_names(names, user)).to eql(['jack'])
        end
    end
end