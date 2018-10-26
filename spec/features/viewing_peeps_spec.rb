feature 'Viewing Peeps' do
  scenario 'A user can see Peeps' do
    visit('/')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "This is another peep"
    expect(page).to have_content "This is a third peep"
  end
end
