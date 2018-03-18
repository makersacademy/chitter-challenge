require_relative '../../app.rb'

feature 'Submit new user' do
  scenario 'A new user can create an account' do
    visit('/')
    fill_in 'name', with: 'Alexandra'
    click_button 'Submit'
    expect(page).to have_content('Welcome!')
  end
end
