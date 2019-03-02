feature 'adding a peep' do

  scenario 'logged-out, the new peep button is not available' do

    visit '/peeps'

    expect(page).to_not have_button 'Make a Peep'
    
  end

  scenario 'the new peep appears on the page and is attrubuted to the user who posted it' do

    # sign-up first
    visit '/accounts/new'
    fill_in :email, with: 'user@example.com'
    fill_in :name, with: 'Test User'
    fill_in :username, with: 'testuser'
    fill_in :password, with: '123456'
    click_button 'Sign-up!'
    
    # log in
    visit '/accounts/login'
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: '123456'
    click_button 'Log-in!'
    
    visit '/peeps'
    click_button 'Make a Peep'

    fill_in :text, with: 'Peep dis!'
    click_button 'Peep!'

    expect(page).to have_content 'Peep dis!'
    expect(page).to have_content 'Chitted by: testuser'
  end

end
