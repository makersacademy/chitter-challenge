feature "Sign up" do
  scenario 'user can sign up to use chitter' do
    visit('/signup')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "Please sign up"
    fill_in :user_name, with: "amfibiya17"
    fill_in :password, with: "12345678"
    expect(page).to have_button 'Sign up'
    click_button 'Sign up'
  end
end