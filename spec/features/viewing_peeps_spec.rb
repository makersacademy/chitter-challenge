require 'pg'

feature 'Viewing peeps on the wall' do
  scenario 'A user can see their peeps in Chitter' do
    # visit('/signup')
    # fill_in :user_name, with: 'amfibiya17'
    # fill_in :password, with: '12345678'
    # click_button 'Sign up'
    # visit('/login')
    # fill_in :user_name, with: 'amfibiya17'
    # fill_in :password, with: '12345678'
    # click_button 'Login'
    # visit('/message')
    # fill_in :text, with: 'My bla bla bla text'
    # click_button 'Submit'
    # visit('/wall')
    # expect(page).to have_content 'Chitter'
    # expect(page).to have_content 'My peeps'
    # expect(page).to have_button 'Add message'
    # expect(page).to have_button 'Log out'

    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(peep_text: 'Every application somehow needs PosgreSQL')
    
    visit('/wall')

    expect(page).to have_content 'Every application somehow needs PosgreSQL'
  end
end