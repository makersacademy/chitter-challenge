feature "You can add a peep" do

  scenario "The user adds a peep" do
    visit('/')
    fill_in('Comment_box', with: 'My first peep')
    click_button('Submit')
    expect(page).to have_content('My first peep')
  end

end
