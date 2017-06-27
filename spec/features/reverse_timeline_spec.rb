feature 'Reverse Timeline' do
  scenario 'User can view their peeps in reverse chronological order' do
    sign_up
    # sign_in
    visit '/posts/new'
    fill_in 'message', with: 'A first peep!'
    click_button 'Add Peep'
    visit '/posts/new'
    fill_in 'message', with: 'A second peep!'
    click_button 'Add Peep'
    expect(page).to have_content "Message: A second peep! posted by johndoe#{Time.now.strftime(" at %I:%M%p on %m/%d/%Y")} Message: A first peep! posted by johndoe#{Time.now.strftime(" at %I:%M%p on %m/%d/%Y")}"
  end
end
