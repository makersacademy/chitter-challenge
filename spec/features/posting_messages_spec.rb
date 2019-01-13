RSpec.feature 'posting messages' do
    
    before {
        generic_signup
        logout_user
        sign_in
    }

    context ' a user is logged in want to post message' do
        let(:dummy_message){ 'really theres a mouse in the house'}
     
        it 'displays the post message form if user is logged in' do 
            expect(page).to have_selector("input[name=message]")
        end
        
        it 'allows user to post a message to the page' do
            post_message(dummy_message)
            expect(page).to have_content(dummy_message[0...20])
        end
            
        it 'should save with a time stamp' do
            
            time = DateTime.now
            post_message
            expect(page).to have_content time
        end

        it 'should show the username of who posted' do
            # jack is generic sign up user name
            post_message
            expect(page).to have_content('jack')
        end
    end


end