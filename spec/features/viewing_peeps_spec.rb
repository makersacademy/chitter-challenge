feature 'Viewing peeps' do
  scenario 'a user can view all of their peeps' do
    visit '/peeps'
    expect(page).to have_content "My first peep"
    expect(page).to have_content "My second peep"
    expect(page).to have_content "My third peep"
  end
end
