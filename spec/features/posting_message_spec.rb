feature "posts a message" do 
    scenario 'user can post a message on chitter' do
        visit('/')
        fill_in 'message', with: 'chitter is the best'
        click_button 'post'
        expect(page).to have_content 'chitter is the best'
    end
end