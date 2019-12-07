feature "post messages to Chitter" do
  scenario "user has option to go and write a peep" do
    visit '/'
    click_on 'Peep'

    expect(page).to have_content "What's on your mind?"
    expect(page).to have_button "Publish"
  end

  scenario "user can publish their peep to the timeline" do
    visit '/'
    click_on 'Peep'
    fill_in 'message', with: "I think"
    click_on 'Publish'

    expect(page).to have_content "I think"
  end
end
