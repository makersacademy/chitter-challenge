feature 'Log in' do

  scenario 'I see a log in page with fields and a log in button' do
    visit('/log_in')

    expect(page).to have_field("username")
    expect(page).to have_field("password")
    expect(page).to have_button("Log in")
  end

end
