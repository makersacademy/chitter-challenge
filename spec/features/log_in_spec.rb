feature 'Log in' do
  scenario 'A user is able to find a button to log in' do
    visit('/')

    expect(page).to have_content('Log in')
  end

  scenario 'A user is redirected to the log in page' do
    visit('/')
    click_button('Log in')

    expect(page).to have_css("input#email")
    expect(page).to have_css("input#password")
  end
end
