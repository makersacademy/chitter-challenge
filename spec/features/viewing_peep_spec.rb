feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/timeline')

    expect(page).to have_content "Yo"
    expect(page).to have_content "I just ate"
    expect(page).to have_content "Goodnight everyone"
  end
end
