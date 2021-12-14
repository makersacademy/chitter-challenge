feature 'signing up' do
  scenario 'a user can sign up' do
    visit('/')
    click_button('Sign up')

    fill_in('email', with: 'jd@gmail.com')
    fill_in('password', with: 'mycatsname')
    # fill_in('name', with: 'Jane Doe')
    fill_in('username', with: 'j_doe')
    click_button('Submit')

    expect(page).to have_content ('Thank you for signing up!')
  end
end