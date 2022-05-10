feature "Add message" do
  scenario 'add message (peep) to chitter' do
    visit('/message')
    expect(page).to have_content "Slava's chitter"
    fill_in :text, with: "My bla bla bla text"
    expect(page).to have_button 'Submit'
    click_button 'Submit'
  end
end
