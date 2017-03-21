feature '3: user log out' do
  scenario 'user that has logged in can log out of the app' do

    sign_up
    login

    click_button('Log out')

    expect(page).to have_content('Bye! Come again soon.')
    expect(page).not_to have_content('Logged in as Kat')

  end
end
