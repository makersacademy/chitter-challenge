feature "Adding a new peep" do
  scenario "A user can add a new peep to the feed" do
    visit ('/home/new')
    fill_in('peep_text', with: 'Is 100% humidity technically underwater?')
    click_button('Peep')
    expect(page).to have_content('Is 100% humidity technically underwater?')
  end
end
