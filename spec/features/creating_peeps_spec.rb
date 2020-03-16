
feature "Creating Peeps" do
  scenario "User can create and post a Peep" do
    signup_and_login
    expect(current_path).to eq "/peeps"
    click_button 'Write Peep'
    fill_in 'peep', with: 'This is a test Peep!'
    click_button 'Submit'
    expect(current_path).to eq "/peeps"
    expect(first('.peep')).to have_content 'This is a test Peep!'
  end
end
