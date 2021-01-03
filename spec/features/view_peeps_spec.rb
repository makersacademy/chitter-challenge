feature 'Viewing peeps' do
  scenario 'A user can see all peeps' do
    visit('/peeps')
    expect(page).to have_content "test peep"
    expect(page).to have_content "another test peep"
    expect(page).to have_content "a third test peep"
  end
end
