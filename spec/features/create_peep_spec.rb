feature 'create new peep' do
  scenario 'user can add peep and see it' do
    Peep.create("this is a test peep")
    visit('/')
    expect(page).to have_content("this is a test peep")
  end
end