feature "Creating peeps" do

  scenario "can't create peep when no user signed in" do
    visit'/'
    expect(page).to_not have_content("New peep")
  end

  scenario "I can create a new peep when user signed in" do
    valid_user = create :user

    visit '/'
    expect(page).to have_content("New peep")
    
    fill_in 'peep_text', :with => "This is the second peep"
    click_button 'Post'

    expect(page).to have_content("This is the second peep")
  end

end