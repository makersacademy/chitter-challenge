feature 'The user can log themselves in' do
  scenario 'once they have signed up' do
    visit '/'
    log_in_as_billy
    expect(page).to have_content "You are logged in as billy1"
    current_user = retrieve_settings.current_user
    expect(current_user.name).to eq 'Billy'
    expect(current_user.username).to eq 'billy1'
    log_out_of_page
  end
end
