describe 'signing up' do
  it 'requires a matching confirmation password' do
    visit '/signup'
    fill_in :name, with: 'Reshma'
    fill_in :username, with: 'Reshma123'
    fill_in :email, with: 'reshma@test.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'passwordwad'
    click_button('Sign Up')
    expect(User.all.count).to eq 0
  end
  it 'goes to the right page and increases user count' do
    sign_up
    expect(page.current_path).to eq '/home'
    expect(page).to have_content 'Welcome to Chitter, Reshma123'
    expect(User.all.count).to eq 1
  end
end
