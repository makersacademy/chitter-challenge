# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Users can post to Chitter' do
  scenario 'Users can post to chitter if signed in' do
    sign_up
    log_in
    click_button('Cheet!')
    fill_in('title', with: "My first post")
    fill_in('body', with: "Hello Chitter world!")
    click_button('Submit')
    expect(page).to have_content "My first post"
    expect(page).to have_content "Hello Chitter world!"
  end

  scenario "Users can see cheets is reverse chronological order" do
    sign_up
    log_in
    click_button('Cheet!')
    fill_in('title', with: "My first post")
    fill_in('body', with: "Hello Chitter world!")
    click_button('Submit')
    click_button('Cheet!')
    fill_in('title', with: "My second post")
    fill_in('body', with: "Hello Chitter world!")
    click_button('Submit')
    expect("My second post").to appear_before("My first post")
  end




  scenario "Users can see the time that they posted" do
    allow_any_instance_of(Post).to receive(:time).and_return("21:17")
    sign_up
    log_in
    click_button('Cheet!')
    fill_in('title', with: "My first post")
    fill_in('body', with: "Hello Chitter world!")
    click_button('Submit')
    expect(page).to have_content "21:17"
  end

end
