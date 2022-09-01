require 'pg'

feature 'A new user signs up' do
  scenario 'a new user provides details which are saved' do
    visit ('chitter/sign_up')
    fill_in('name', with: 'Harry')
    fill_in('email', with: 'potterules@hp.com')
    fill_in('password', with: 'deathtovoldy')
    click_button ('Submit')

    expect(user.name).to eq 'Harry'
  end
end