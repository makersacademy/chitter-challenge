feature "Add post to chitter" do

  scenario "Adding a post onto the chitter feed is not possible if not logged in" do
    visit('/')

    expect(current_path).to eq '/' 
    expect(page).to_not have_content 'Hello, world!'
    expect(page).to_not have_button 'Send Peep'
    expect(page).to_not have_field 'peep'
  end

  scenario "Adding a post onto the chitter feed is possible if logged in" do
    create_user_and_log_in
    fill_in 'peep', with: 'Hello, world!'
    click_button 'Send Peep'

    expect(current_path).to eq '/' 
    expect(page).to have_content 'Hello, world!'
    expect(page).to have_button 'Send Peep'
    expect(page).to have_field 'peep'
  end

end
