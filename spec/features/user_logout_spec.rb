feature 'User management: log out' do

  scenario 'User is greeted upon log out' do
    sign_up
    log_in
    click_button('Log out')
    expect(current_path).to eq('/sessions/end')
    expect(page).to have_content('See you next time!')
    click_button('Back to log in page')
    expect(current_path).to eq('/users/new')
  end
end
