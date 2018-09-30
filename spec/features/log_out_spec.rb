feature 'user log out' do
  scenario 'so another user cancot peep as me' do
    log_in
    expect(page).to have_link('Log Out', href: '/user/logout')
  end
  scenario 'log out' do
    log_in
    click_link('Log Out')
    expect(page).not_to have_link('Log Out', href: '/user/logout')
    expect(page).to have_link('Log In', href: '/user/login')
  end
end
