feature 'viewing peeps feed' do
  scenario 'shows a list of peeps in reverse date order' do

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

    fill_in :text, with: 'First Peep...'
    click_button 'Peep!'

    visit '/peeps'
    click_button 'Make a Peep'

    fill_in :text, with: 'Second Peep...'
    click_button 'Peep!'

    visit '/peeps'
    click_button 'Make a Peep'

    fill_in :text, with: 'Third Peep...'
    click_button 'Peep!'

    # log out
    click_button 'Log out!'

    expect(first('.peep')).to have_content 'Third Peep...'
  end
end
