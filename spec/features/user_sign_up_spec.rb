feature 'User sign up' do
  scenario 'I can sign up for Chitter' do
    visit '/sign-up'
    fill_in 'name', with: 'Matt'
    fill_in 'username', with: 'iammatthewward'
    fill_in 'email', with: 'matt@email.com'
    fill_in 'password', with: 'secret_password'
    click_button 'Sign up'

    expect(page.status_code).to eq 200
    expect(User.first.name).to eq 'Matt'
    expect(User.first.username).to eq 'iammatthewward'
    expect(User.first.email).to eq 'matt@email.com'
  end
end
