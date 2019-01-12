RSpec.feature 'posting messages' do

    context ' a user is logged in want to post message' do
        let(:dummy_message){ 'really theres a mouse in the house'} 

        before {
            generic_signup
            p page.body
        }

        after {
            logout_user
        }

        it 'displays the post message form if user is logged in' do 
            expect(page).to have_selector("input[name=message]")
        end
        
        it 'allows user to post a message to the page' do
            post_message(dummy_message)
            expect(page).to have_content(dummy_message)
        end
            
        it 'should save with a time stamp' do
            time = DateTime.now
            post_message
            expect(page).to have_content time
        end
    end

    context ' a user is not logged on' do 

        it 'displays a list of messages' do 
        end
    end
end