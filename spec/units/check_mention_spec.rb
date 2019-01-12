require 'check_mention'

describe UsersMentioned  do

    let(:dummy_message){ 'theres a mouse in the house @bob' }
    let(:second_dummy_message){ '@gill theres a mouse in the house @bob' }

    # it 'recognises if message contains an user' do 
    #    expect(check(dummy_message)).to eql(true)
    # end

    it 'returns the users name' do 
        expect(subject.find_names(dummy_message)).to eql(['bob'])
    end

    it 'it can return multiple user names' do 
        expect(subject.find_names(second_dummy_message)).to eql(['gill','bob'])
    end


end