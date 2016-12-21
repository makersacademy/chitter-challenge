feature "Post Peeps" do

  scenario "I want to post a message" do
    sign_up
    sign_in
    add_peep

    expect(current_path).to include '/peeps'
    expect(page).to have_content "Why can't we give love one more chance?"

  end

  scenario "I can only post a message if I am signed in" do
    add_peep

    expect(current_path).to include '/'
    expect(page).not_to have_content "Why can't we give love one more chance?"
    expect(page).to have_content "Must sign in or sign up before posting a peep"

  end

end
