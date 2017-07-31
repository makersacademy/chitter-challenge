

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    visit '/sign_up'
    fill_in 'email', with: 'nandy2@email.com'
    fill_in 'password', with:'example999'
    expect{click_button('submit')}.to change(User,:count).by(1)
    expect(page).to have_content('Chitter! Welcome, nandy2@email.com')
  end
end
