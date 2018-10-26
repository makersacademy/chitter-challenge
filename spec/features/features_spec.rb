feature "Posting a message" do
  scenario "Visiting the index page" do
    visit('/')
    expect(page).to have_content "Chitter"
  end
  scenario "User posts a message and sees it" do
    visit('/')
    fill_in('message', with: "Hello world! I'm chittering!")
    click_button('post')
    expect(page).to have_content("Hello world! I'm chittering!")
  end
  scenario "User posts and sees all previous messages" do
    visit('/')
    fill_in('message', with: "Hello world! I'm chittering!")
    click_button('post')
    fill_in('message', with: "Yes, yes you are!")
    click_button('post')
    expect(page).to have_content("Hello world! I'm chittering!")
    expect(page).to have_content("Yes, yes you are!")
  end
end
