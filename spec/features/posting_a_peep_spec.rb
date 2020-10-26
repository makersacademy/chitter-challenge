require_relative '../../lib/chitter_account.rb'

feature 'user can post to chitter' do
  scenario 'user is able to input text and submit - posting a peep to chitter' do
    user = ChitterAccount.create(username: 'Jane007', name: 'Jane Austen', email: 'Jdoggydog@myspace.com', password: 'xxx')
    visit('/login')
    fill_in 'username1', with: 'Jane007'
    fill_in 'password1', with:'xxx'
    click_on 'Log In Here'
    click_on 'New peep'
    fill_in 'peep_text', with: 'IT HAS BEEN 4 MONTHS SINCE MY LAST HAIR APPOINTMENT'
    click_on 'Post'
    visit('/chitter_feed')
    expect(page).to have_content('IT HAS BEEN 4 MONTHS SINCE MY LAST HAIR APPOINTMENT')
  end
end