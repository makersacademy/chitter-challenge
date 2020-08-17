require 'sinatra'

feature 'User log in' do
  scenario 'user can log into an existing Chitter account' do
    visit '/'
    fill_in 'username', with: 'test1'
    fill_in 'password', with: 'test1password'
    click_on 'Log In'

    expect(current_path).to eq '/chitter/account/test1'
    #within('textarea') { expect(page).to have_content("What's on your mind, Test?") }
  end

  scenario 'user sees an error if they enter an incorrect username' do
    visit '/'
    fill_in 'username', with: 'incorrect_username'
    fill_in 'password', with: 'test1password'
    click_on 'Log In'

    expect(current_path).to eq '/'
    expect(page).to have_content 'Incorrect email or password. Please double-check and try again.'
  end

  scenario 'user sees an error if they enter an incorrect password' do
    visit '/'
    fill_in 'username', with: 'test1'
    fill_in 'password', with: 'incorrect_password'
    click_on 'Log In'

    expect(current_path).to eq '/'
    expect(page).to have_content 'Incorrect email or password. Please double-check and try again.'
  end
end
