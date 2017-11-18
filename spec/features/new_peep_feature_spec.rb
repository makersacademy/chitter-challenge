feature "Write a new Peep" do
  scenario "user wants to write a new peep" do
    visit('/')
    sign_up
    click_button('New Peep!')
    expect(page).to have_content('Create a new peep!')
  end
end
