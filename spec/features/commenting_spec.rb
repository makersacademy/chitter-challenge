RSpec.feature 'commenting on messages' do

    let(:dummy_message){ 'theres a mouse in the house'}

    before {
        generic_signup
        logout_user
        sign_in
        post_message(dummy_message)
    }

    context "as a user i'd like to comment on someone elses post" do 
    
      
        it 'should have a comment button on each post if signed in' do 
            expect(page).to have_selector(:button, 'comment')
        end

        it 'should not have a comment button on each post if not signed' do 
            logout_user
            expect(page).not_to have_selector(:button, 'comment')
        end

    end
end