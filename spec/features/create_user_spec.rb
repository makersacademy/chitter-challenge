feature 'Registration' do
  background { truncates }
  # background { add_peep }

  scenario 'a user can sign up to Chitter' do
    visit("/signup")
    fill_in('author', with: 'David')
    fill_in('handle', with: '@DaveDev')
    fill_in('email', with: 'dave@gmail.com')
    fill_in('password', with: 'Dave1234')
    click_button('Sign up to Chitter')
    expect(page).to have_content('Welcome to Chitter, ...')
  end

end