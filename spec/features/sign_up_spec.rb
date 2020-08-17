require 'sinatra'

feature 'User sign up' do
  scenario 'user can sign up to Chitter' do
    visit '/'
    click_on 'Sign Up'

    expect(current_path).to eq '/chitter/account/new'
    fill_in 'full_name', with: 'test two'
    fill_in 'username', with: 'test2'
    fill_in 'email', with: 'test2@email.com'
    fill_in 'password', with: 'test2password'
    click_on 'Sign Up'

    expect(current_path).to eq '/chitter/account/test2'
    #within('textarea') { expect(page).to have_content("What's on your mind, Test?") }
  end

  scenario 'user cannot sign up if given username is in use' do
    visit '/'
    click_on 'Sign Up'

    expect(current_path).to eq '/chitter/account/new'
    fill_in 'full_name', with: 'test two'
    fill_in 'username', with: 'test1'
    fill_in 'email', with: 'test2@email.com'
    fill_in 'password', with: 'test2password'
    click_on 'Sign Up'

    expect(current_path).to eq '/chitter/account/new'
    expect(page).to have_content('This username is already in use.')
  end

  scenario 'user cannot sign up if given email is in use.' do
    visit '/'
    click_on 'Sign Up'

    expect(current_path).to eq '/chitter/account/new'
    fill_in 'full_name', with: 'test two'
    fill_in 'username', with: 'test2'
    fill_in 'email', with: 'test1@email.com'
    fill_in 'password', with: 'test2password'
    click_on 'Sign Up'

    expect(current_path).to eq '/chitter/account/new'
    expect(page).to have_content('This email address is already in use.')
  end
end
