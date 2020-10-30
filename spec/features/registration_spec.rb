feature 'signing up to Chitter' do
  scenario 'user visits a sign up page and enters their details' do
    visit '/peeps'
    click_link('Sign up')
    fill_in('email', with: 'yourname@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'John Doe')
    fill_in('username', with: 'jdoe1982')
    click_button('Sign up')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Welcome, jdoe1982')
  end
end
