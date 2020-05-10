feature 'Log in page' do
  scenario 'User logs into chitter successfully' do
    sign_up
    log_in

    expect(page).to have_content 'Chitter Feed'
  end
end
