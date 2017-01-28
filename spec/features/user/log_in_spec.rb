feature 'users can log in' do
  scenario 'user logs in with good credentials' do
    sign_up
    log_out
    log_in
    expect(page).to have_content '@realDonaldTrump'
  end
end
