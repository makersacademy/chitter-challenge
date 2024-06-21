feature "peeps" do
  scenario "A user is able to create a peep" do
    visit '/peeps/new'
    fill_in 'text', with: 'This is my first test peep!'
    click_on 'Submit'
    expect(page).to have_content('This is my first test peep!')
  end
end