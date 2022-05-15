feature 'posting chit' do
  scenario 'posting a chit' do
    visit('/post_chit')
    fill_in 'chit', with: "Do you think horses get songs stuck in their heads?"
    fill_in 'handle', with: 'Boyz4now'
    click_button("post chit!")
    expect(page).to have_content('Boyz4now')
    expect(page).to have_content('Do you think horses get songs stuck in their heads?')
  end
end
