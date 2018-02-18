feature "Viewing peeps" do
  scenario "A user can view all peeps" do
    visit '/peeps'
    expect(page).to have_content 'My first peep!'
    expect(page).to have_content 'My second peep!'
    expect(page).to have_content 'My third peep!'
  end
end
