feature 'Registration' do
  scenario 'a user can sign up' do
    visit ('/')
    click_button 'Sign Up'

    expect(current_path).to eq '/users/sign-up'

    fill_in 'name', with: 'Melissa Sedgwick'
    fill_in 'username', with: 'mel_01'
    fill_in 'email', with: 'melissa@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Submit'

    expect(page).to have_content "Welcome, Melissa Sedgwick"
  end
end
