require './spec/spec_helper'

feature Chitter do
  before do
    DatabaseCleaner.clean
    visit '/'
    click_button 'Sign up'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'psswrd'
    fill_in 'name', with: 'Foo Bar'
    fill_in 'username', with: 'foo_bar88'
    click_button 'Submit'
    click_button 'Login'
    fill_in 'username', with: 'foo_bar88'
    fill_in 'password', with: 'psswrd'
    click_button 'Submit'
  end
  scenario 'ability to sign up' do
    visit '/'
    expect(User.last.name).to eq 'Foo Bar'
  end
  scenario 'ability to see the peeps on the home page' do
    visit '/'
    fill_in 'peep_text', with: 'Hello world'
    click_button 'Peep'
    expect(page).to have_content "Hello world"
  end
  scenario 'show the user who posted the peep' do
    visit '/'
    fill_in 'peep_text', with: 'Hello world'
    click_button 'Peep'
    expect(page).to have_content "foo_bar88"
  end
  scenario 'authenticates the user' do
    click_button 'Login'
    fill_in 'username', with: 'foo_bar88'
    fill_in 'password', with: 'psswrd'
    click_button 'Submit'
    expect(page).to have_content 'foo_bar88'
  end
end
