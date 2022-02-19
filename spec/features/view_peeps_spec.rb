feature 'Viewing peeps in reverse order' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "Hello"
    expect(page).to have_content "Ciao ragazzi"
    expect(page).to have_content "I love coding weekends"
  end
end
