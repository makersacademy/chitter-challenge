require './app/models/peep.rb'

RSpec.feature 'sign up to chitter' do

  scenario 'I want to sign up to chitter' do
    visit '/user/new'
    fill_in 'username', with: 'testusername'
    fill_in 'password', with: 'testpassword'
    click_button 'Sign Up'
    save_and_open_page

    expect(current_path).to eq '/'

    expect(page).to have_content('testusername')
  end
end
