feature "peeping to Chitter" do
  scenario "the user posts a peep" do
    visit '/'
    click_button 'Give us a peep'
    fill_in 'peep_message', with: "I'm peeping at Chitter!"
    click_button 'Peep it!'
    expect(page).to have_content "I'm peeping at Chitter!"
  end

  scenario "posting a peep with a username" do
    visit '/'
    click_button 'Give us a peep'
    fill_in 'peep_message', with: "This peep is from a user"
    fill_in 'username', with: "User 123x"
    click_button 'Peep it!'
    expect(page).to have_content "This peep is from a user"
    expect(page).to have_content "User 123x"
  end
end
