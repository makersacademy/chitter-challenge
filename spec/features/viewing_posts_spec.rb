feature "viewing posts and comments" do
  scenario "Viewing new posts in reverse chronological order" do
    create_user_and_log_in
    fill_in "peep",	with: "Hello, world!"
    click_button 'Send Peep'
    fill_in "peep", with: "Hello, again, world!"
    click_button 'Send Peep'

    expect(page.text.index("Hello, world!")).to be > page.text.index("Hello, again, world!")
  end

  scenario "Viewing new posts with time of post" do
    create_user_and_log_in
    fill_in "peep",	with: "Hello, world!"
    click_button 'Send Peep'

    expect(page).to have_content "Hello, world!"
    expect(page).to have_content Time.now.utc.strftime("%d/%m/%Y %k:%M").to_s
  end

  scenario "Viewing new posts with time of post and username of person who posted" do
    create_user_and_log_in
    fill_in "peep",	with: "Hello, world!"
    click_button 'Send Peep'

    expect(page).to have_content "Hello, world! posted by ChrisL #{Time.now.utc.strftime("%d/%m/%Y %k:%M")}"
  end

  scenario "Viewing comments in chronological order" do
    post = create_user_and_post
    log_in

    first('.post').click_button 'Add Comment'

    fill_in 'comment', with: 'Hi'
    click_button 'Submit'

    first('.post').click_button 'Add Comment'
    
    fill_in 'comment', with: 'you!'
    click_button 'Submit'

    expect(page.text.index("you!")).to be > page.text.index("Hi")
  end

end
