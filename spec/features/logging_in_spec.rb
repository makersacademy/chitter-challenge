feature "Logging in" do
  scenario 'correct login information' do
    register_a_user

    visit '/'
    click_link 'Login'

    fill_in :email, with: 'ash@pallet.com'
    fill_in :password, with: 'pikachu123'

    click_button 'Login'
    expect(page).to have_content 'Logged in as Ash Ketchum (@red)'
    expect(page).not_to have_link 'Login'
    expect(page).not_to have_link 'Register'
  end
end
