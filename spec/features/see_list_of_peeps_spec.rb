
feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/')

    expect(page).to have_content "My 0th test peep"
    expect(page).to have_content "Another test peep"
    expect(page).to have_content "The last test peep"
  end
end
