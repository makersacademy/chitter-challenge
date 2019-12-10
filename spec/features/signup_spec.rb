feature 'User sign up' do
  scenario 'a user can sign up to Chitter' do
    user_sign_up

    visit '/peeps'

    expect(page).to have_content 'Welcome to Chitter jesstest'
  end
end
