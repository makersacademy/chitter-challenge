feature "Sign up" do
  scenario 'user can sign up to use chitter' do
    visit('/signup')
    fill_in :user_name, with: "amfibiya17"
    fill_in :password, with: "12345678"
    fill_in :email, with: 'test@email.com'
    
    expect(page).to have_button 'Create Account'
    click_button 'Create Account'
  end
end