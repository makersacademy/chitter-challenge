feature "making a peep" do
  scenario "user can make a peep" do
    visit('/')
    fill_in('text', with: 'My first peep')
    click_button('Submit')
    expect(page).to have_content 'My first peep'
  end
end
