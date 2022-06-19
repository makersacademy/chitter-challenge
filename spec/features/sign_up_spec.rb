feature 'signing up for Chitter' do
  scenario 'user can sign up by completing form on homepage' do
    visit('/')
    fill_in('name', with: 'Dack Jorsey')
    fill_in('username', with: "dack")
    fill_in('email', with: 'dack@chitter.com')
    fill_in('password', with: "password123")
    click_button('Sign up for Chitter')

    expect(current_path).to eq '/sessions/new'
  end
end
