feature 'logging in' do
  scenario 'user logs in' do
    sign_up
    log_in
    expect(page).to have_content 'Welcome jo@jo.com !'
  end
end