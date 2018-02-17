feature 'Viewing peeps' do
  scenario 'A user can see a list of peeps' do
    visit('/')

    expect(page).to have_content "This is a test peep"
    expect(page).to have_content "This is another test peep"
  end
end
