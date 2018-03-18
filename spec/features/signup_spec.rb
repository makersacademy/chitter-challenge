feature 'sign up' do
  scenario 'a user can sign up to chitter' do
    visit('/sign_up')
    fill_in('Email', with: 'jl7e12@gmail.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'CindyLiu')
    fill_in('username', with: 'Cindy')
    click_button('Submit')

    expect
  end
end
