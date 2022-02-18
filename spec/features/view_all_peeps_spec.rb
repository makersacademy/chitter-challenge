feature "viewing all peeps" do
  # As a maker
  # So that I can see what others are saying  
  # I want to see all peeps in reverse chronological order
  scenario "view peeps in reverse chronological order" do
    
    # Add the test data
    user = create_test_user
    Peep.create(peep: "Wow, that's so cool", user_id: user.id)
    Peep.create(peep: "The end is nigh", user_id: user.id)

    visit '/peeps'

    first_list_item = page.find('.peep', text: "The end is nigh", match: :prefer_exact)
    second_list_item = page.find('.peep', text: "Wow, that's so cool", match: :prefer_exact)
 
    expect(first_list_item).to appear_before(second_list_item)
    
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario "view peeps shows the date and time for each peep listed" do
    user = create_test_user
    peep = Peep.create(peep: "Wow, that's so cool", user_id: user.id)
    Peep.create(peep: "The end is nigh", user_id: user.id)

    visit '/peeps'

    expect(page).to have_content(peep.created_at)
  end

  scenario "shows the username of the maker associated with a peep" do
    user = create_test_user
    peep = Peep.create(peep: "Wow, that's so cool", user_id: user.id)
    visit '/peeps'
    expect(page).to have_content("Peeped by: #{user.user_name}")
  end
end
