feature "view peeps" do
  scenario "User goes to main page and views peeps" do
    visit '/'
    expect(page).to have_content "I love dogs"
    expect(page).to have_content "I love cats"
  end

end
