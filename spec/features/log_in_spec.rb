require 'sinatra'

feature 'User log out' do
  scenario 'user can log out of Chitter' do
    visit '/'
    fill_in 'username', with: 'test1'
    fill_in 'password', with: 'test1password'
    click_on 'Log In'

    expect(current_path).to eq '/chitter/account/test1'

    click_on 'Log Out'

    expect(page).to have_content 'You have signed out.'
    expect(current_path).to eq '/'
  end
end
