feature 'sign up' do
  scenario 'user can click sign up button and be sent to sign up page' do
    visit('/')
    click_button('Sign Up')
    expect(page).to have_content('Sign up for Chitter and connect with Peeps!')
  end
  scenario "site says you aren't logged in if not signed up" do
    visit('/')
    expect(page).not_to have_content('Logged in as Megadrive')
  end
  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Password and confirmation password do not match')
  end
  scenario 'returns confirmation message following signup' do
    sign_up
    expect(page).to have_content('Logged in as Megadrive')
  end
end
