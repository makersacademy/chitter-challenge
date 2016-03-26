feature 'User management: log out' do

  scenario 'User is greeted upon log out' do
    sign_up
    log_in
    log_out
    expect(current_path).to eq('/sessions/end')
    expect(page).to have_content('See you next time!')
  end

  scenario 'User can go back to log in page upon log out' do
    sign_up
    log_in
    log_out
    click_button('Back to log in page')
    expect(current_path).to eq('/sessions/new')
  end

  scenario 'User can create a new account upon log out' do
    sign_up
    log_in
    log_out
    click_button('Create a new account')
    expect(current_path).to eq('/users/new')
  end
end
