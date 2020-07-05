feature "view the time with peeps" do
  scenario "a user has posted a peep and wants to see the time of the peep" do
    visit '/'
    click_button("Post Peep")
    expect(page).to have_content("What's on your mind?")
    fill_in "user", with: 'Time check'
    fill_in "user_handle", with: '@time_check'
    fill_in 'message', with: 'This is a test'
    click_button('Peep')
    time = Time.now.strftime("%I:%M %p %d/%m/%Y")
    
    expect(page).to have_content(time)
  end
end