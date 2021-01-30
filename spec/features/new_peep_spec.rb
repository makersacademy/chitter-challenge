feature 'Posting a peep' do 
    scenario 'A user can post a new peep' do
        visit ('/peeps/new')
        fill_in 'peep', with: 'This is my new peep'
        click_button 'Post peep'
        
    
    expect(page).to have_content('This is my first peep!')
    end 
end 