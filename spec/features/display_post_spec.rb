feature "list peeps" do
  scenario "provide a list of your peeps" do
    visit('/')
    click_button('Add peep')
    fill_in('addpeep', with: 'first')
    click_button('Peep')
    click_button('Display peeps')
    expect(page).to have_content("Here are your peeps")
  end
end