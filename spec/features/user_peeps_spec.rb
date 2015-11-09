feature "So that I can let people know what I am doing" do
  scenario "I want to post a peep" do
    visit '/'
    click_link('signin')
    fill_in :email,       with: "user@email.com"
    fill_in :password,    with: "12345678"
    click_button('Sign In')
    click_link('postp')
    expect(page.status_code).to eq 200
    expect(page).to have_content("Post")
  end

  scenario "I want to see date/time on the peeps that are posted" do
    visit '/'
    click_link('signin')
    fill_in :email,       with: "user@email.com"
    fill_in :password,    with: "12345678"
    click_button('Sign In')
    click_link('postp')
    fill_in :message, with: "This is a peep from me"
    click_button('Post')
    expect(page).to have_content("This is a peep from me")
  end

end
