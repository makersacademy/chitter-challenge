feature "Posting messages (peeps)" do
  scenario "User can post a Peep to Chitter" do
    visit '/'
    click_button 'Post new Peep'
    fill_in('peep_body', with: 'First!')
    click_button 'Submit'
    expect(page).to have_content('First!')
  end
end
