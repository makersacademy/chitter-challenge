describe 'signing up' do
  it 'allows the user to input signup data' do
    visit '/signup'
    fill_in :name, with: 'Reshma'
    fill_in :username, with: 'Reshma123'
    fill_in :email, with: 'reshma@test.com'
    fill_in :password, with: 'password'
    click_button('Sign Up')
  end
  it 'goes to the right page' do
    visit '/signup'
    fill_in :name, with: 'Reshma'
    fill_in :username, with: 'Reshma123'
    fill_in :email, with: 'reshma@test.com'
    fill_in :password, with: 'password'
    click_button('Sign Up')
    expect(page.current_path).to eq '/home'
    #  expect(page).to have_content 'HI! Thank you for signing up Reshma123'
    expect(User.all.count).to eq 1
  end
end
