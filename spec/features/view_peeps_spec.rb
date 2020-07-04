feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/chitter')

    expect(page).to have_content "Hello this is a peep"
    expect(page).to have_content "also a peep"
    expect(page).to have_content "another peep"
  end
end
