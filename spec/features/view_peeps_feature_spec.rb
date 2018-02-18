feature "view peeps" do
  scenario "User goes to main page and views peeps with time displayed" do
    visit '/peeps'
    expect(page).to have_content "I love dogs"
    expect(page).to have_content "I love cats"
    expect(page).to have_content "11:31AM, 18 February"
  end

end
