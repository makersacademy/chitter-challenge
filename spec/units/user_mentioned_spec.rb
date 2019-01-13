require 'user_mentioned'
require 'user'

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

    context 'checking against users' do
        let(:names) { ['bob'] }
        let(:user){ double }

        it 'should be able to validate if these are real users' do 
            allow(user).to receive(:first).and_return('bob')
            expect(subject.validate_names(names, user)).to eql(['bob'])
        end

        it 'should be able to validate if these are real users - multiple' do 
            allow(user).to receive(:first).and_return('bob', 'jack')
            expect(subject.validate_names(names, user)).to eql(['bob'])
            expect(subject.validate_names(names, user)).to eql(['jack'])
        end
    end

    # context 'checking user exist' do 
    #     let(:dummy_email){ 'someone@somewhere.com' }
    #     let(:dummy_password) { 'password' }
    #     let(:dummy_username) { 'Ratchet' }
    #     let(:dummy_name) { 'furball' }

    #     before {
    #         start_sign_up
    #         sign_up_name(dummy_name)
    #         sign_up_username(dummy_username)
    #         sign_up_email(dummy_email)
    #         sign_up_password(dummy_password)
    #         submit_sign_up
    #         logout_user
    #     }

    #     it 'should return name of mentioned' do 
    #         generic_signup
    #         expect(subject.validate_names('Ratchet', User)).to eql('Ratchet')
    #         expect(post_message('@Ratchet')).to eql(Ratchet)
    #     end
    # end

end