feature 'the site has a homepage' do
  scenario 'the user visits the homepage' do
    visit('/')
    expect(page).to have_content("chitter")
  end
end

feature 'users can peep' do
  scenario "the site's homepage has a form that asks people to peep" do
    visit('/')
    expect(page).to have_content("new peep")
  end

end
