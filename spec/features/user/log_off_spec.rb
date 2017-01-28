feature 'users can log off' do
  scenario 'user logs off' do
    sign_up
    log_out
    expect(page).to have_content 'new user'
  end
end
