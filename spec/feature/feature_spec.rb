require './spec/spec_helper'

feature Chitter do
  scenario 'ability to sign up' do
    DatabaseCleaner.clean
    visit '/'
    click_button 'Sign up'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'psswrd'
    fill_in 'name', with: 'Foo Bar'
    fill_in 'user_name', with: 'foo_bar88'
    click_button 'Submit'
    expect(User.last.name).to eq 'Foo Bar'
  end
  scenario 'ability to see the peeps on the home page' do
    visit '/'
    fill_in 'peep_text', with: 'Hello world'
    click_button 'Peep'
    expect(page).to have_content "Hello world"
  end
end
