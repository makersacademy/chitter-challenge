feature 'log in' do
  scenario 'user can log in' do
    log_in
    expect(page).to have_content("You're signed in as dk.")
  end

  scenario 'there is a log in link on the peeps page' do
    visit('/peeps')
    click_link('log in')
    expect(page).to have_current_path('/log-in')
  end

  scenario 'log in link does not appear when signed in' do
    log_in
    expect(page).to_not have_content('log in')
  end
end
