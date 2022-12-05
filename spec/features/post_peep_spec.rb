feature 'post_peep' do 

  scenario 'logged in user can post peep' do
    # Create Account
    visit ('/account/new')
    fill_in :username, with: "test1"
    fill_in :email_address, with: "test1@test.com"
    fill_in :password, with: "test123"
    fill_in :full_name, with: "testy test"
    click_button
    #Visit timeline
    visit('/login')
    fill_in :email_address, with: "test1@test.com"
    fill_in :password, with: "test123"
    click_button 
    expect(page).to have_content "Chitter Timeline"
    #post peep button
    expect(page).to have_link "New Peep"
    click_on 'New Peep'
    expect(page).to have_content "Create a Peep"
    fill_in :content, with: "a completely new peep to test"
    expect(page).to have_button 
    click_button 
    expect(page).to have_content "New peep created: a completely new peep to test"
    #Check page has new peep
    visit('/')
    expect(page).to have_content "a completely new peep to test"
    
  end 

end 