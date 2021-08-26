feature 'all peeps can be viewed' do
  scenario 'able to see all peeps' do
    Peep.create("this is a test peep")
    visit('/peeps')
    expect(page).to have_content("this is a test peep")
  end
end
