feature 'Visiting Chitter' do
  scenario 'a user can view the page' do
    visit '/peeps'
    expect(page).to have_content "My first Peep"
  end
end
