feature 'creates a peep' do
    scenario "user can't create a peep unless logged in" do
        visit('/')
        fill_in 'peep', with:'Test peep'
        click_button 'Post'
        expect(page).to have_content('Not logged in')
    end

    scenario 'user can create a peep and post to feed' do
        User.create(user_name:'test', email:'test@test.com', password:'test')
        visit('/')
        fill_in 'peep', with:'Test peep'
        click_button 'Post'
        expect(page).to have_content('Test peep')
    end
end