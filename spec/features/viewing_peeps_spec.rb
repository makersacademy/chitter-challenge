feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "Blah blah"
    expect(page).to have_button "Sign-up"
    expect(page).to have_button "Log-in"
  end
end
