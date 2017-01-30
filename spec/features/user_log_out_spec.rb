feature 'User Log Out' do

  scenario 'user can log out' do
    sign_up
    find(:css, "a[href='/sessions/new']").click
    fill_in('email', with: "test@test.com")
    fill_in('password', with: "password")
    click_button('Log in')
    find(:css, "a[href='/sessions/new']").click
    find(:css, "a[href='/sessions/logout']").click

    expect(page).to have_content 'Goodbye, see you again soon'
    expect(page).not_to have_content 'Welcome, paulyjgooders@gmail.com'
    expect(current_path).to eq '/'
  end

end
