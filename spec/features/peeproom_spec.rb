feature "Displays Peeps" do
  scenario "Displays posts from peep page" do
    visit '/peeproom'

    expect(page).to have_content 'my first peep'
    expect(page).to have_content 'my second peep'
  end
end
