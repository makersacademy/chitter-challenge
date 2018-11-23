feature "peeping to Chitter" do
  scenario "the user posts a peep" do
    visit '/'
    click_button 'Give us a peep'
    fill_in 'peep_message', with: "I'm peeping at Chitter!"
    click_button 'Peep it!'
    expect(page).to have_content "I'm peeping at Chitter!"
  end
end
