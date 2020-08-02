feature 'Viewing peeps' do
  scenario 'A user can see peeps in reverse chronological order' do
    visit('/peeps')

    expect(page).to have_content "Good morning"
    expect(page).to have_content "Good afternoon"
    expect(page).to have_content "Good night"
  end
end
