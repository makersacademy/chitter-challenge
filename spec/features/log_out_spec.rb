feature 'log out' do
  let(:user_info) { { 'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'} }

  scenario 'logout button clicked' do
  
  create_peeps(user_info)
  login(user_info)

  expect(page).to have_content('one')
  
  click_button('logout')

  expect(page).not_to have_content('one')

  expect(current_path).to eq('/')
  end
end
