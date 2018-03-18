feature 'sign up' do
  scenario 'a user can sign up to chitter' do
    visit('/users/new')
    fill_in('email', with: 'jl7e12@gmail.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'CindyLiu')
    fill_in('username', with: 'Cindy')
    click_button('Submit')

    expect(page).to have_content "Welcome, jl7e12@gmail.com"
  end
end
