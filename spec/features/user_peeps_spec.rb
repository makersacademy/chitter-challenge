feature "So that I can let people know what I am doing" do
  scenario "I want to post a peep" do
    visit '/'
    if !page.has_content?('We have no peeps yet...')
      click_link('signin')
      fill_in :email,       with: "user@email.com"
      fill_in :password,    with: "12345678"
      click_button("Sign In")
      expect(page).to have_content("Hi, David Jones!")
      click_link('postp')
      expect(page).to have_content("Post")
      fill_in :message, with: "This is a peep from me"
      click_button('Post')
      expect(page).to have_content("This is a peep from me")
    end
  end

end
