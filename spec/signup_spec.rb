describe 'signing up' do
  it 'allows the user to input signup data' do
    visit '/sign_up'
    fill_in 'Name', with: 'Reshma'
    fill_in 'Username', with: 'Reshma123'
    fill_in 'Email', with: 'reshma@test.com'
    fill_in 'Password', with: 'password'
    click_button('Submit!')
  end
  it 'goes to the right page' do
    expect(page.current_path).to eq '/confirm'
    expect(page).to have_content 'Hello Reshma123, thank you for signing up'
    expect(User.all.count).to eq 1
  end
end
