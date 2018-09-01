require_relative '../setup_test_database'
require_relative 'web_helpers'

feature 'User has to sign in before being able to post' do
  scenario 'before signing in the user cannot post' do
    visit('/')
    expect(page).to have_button('Sign up')
    fill_in('name', with: 'Dave')
    fill_in('email', with: 'dave@dave.com')
    fill_in('password', with: 'pw123')
    fill_in('username', with: 'dave123')
    click_button('Sign up')
    expect(page).to have_button('Peep')
  end
end

feature 'User can post a peep to Chitter' do
  scenario 'and see the peep on the homepage' do
    sign_up
    fill_in('peep', with: 'This is a test peep')
    click_button('Peep')
    expect(page).to have_content('This is a test peep')
  end
end

feature 'User can see peeps on Chitter' do
  scenario 'in reverse chronological order' do
    sign_up
    str1 = 'This is a test peep'
    str2 = 'This is another test peep'
    fill_in('peep', with: str1)
    click_button('Peep')
    fill_in('peep', with: str2)
    click_button('Peep')
    expect(page.body.index(str2)).to be < (page.body.index(str1))
  end

  scenario 'and also see the time when the peep was posted' do
    sign_up
    fill_in('peep', with: 'test')
    click_button('Peep')
    formatted_time = Time.now.strftime('%I:%M%p on %m/%d/%Y')
    expect(page).to have_content("test was posted at #{formatted_time}")
  end
end
