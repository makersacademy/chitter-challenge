feature "View message" do
  scenario 'can see added messages (peeps) in chitter' do
    visit('/message')
    expect(page).to have_content "Slava's chitter"
    fill_in :text, with: "My bla bla bla text"
    expect(page).to have_button 'Submit'
    click_button 'Submit'
    visit('/wall')
    expect(page).to have_content "My peeps"
    expect(page).to have_content "My bla bla bla text"
    expect(page).to have_button 'Add message'
    expect(page).to have_button 'Log out'
  end
end