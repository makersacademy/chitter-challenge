feature 'Sign in' do
  scenario 'A user can sign in to read and post some messages' do
    visit('/')
    fill_in('email', with: 'example@mail.com')
    fill_in('password', with: 'password')
    fill_in('name', with: 'John')
    expect(page).to have_button('Sign in')
  end
end
