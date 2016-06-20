feature 'log out' do

  scenario 'logs out the existing session' do
    sign_up
    click_button('log out')
    expect(page).to have_button('sign in')
    expect(page).not_to have_content 'Welcome, Tobes'
  end
end
