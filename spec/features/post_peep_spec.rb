feature 'creates a peep' do
    scenario 'user can create a peep and post to feed' do
        visit('/')
        fill_in 'peep', with:'Test peep'
        click_button 'Post'
        expect(page).to have_content('Test peep')
    end

    
end