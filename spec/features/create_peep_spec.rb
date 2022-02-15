feature "posting a message" do
  scenario "a user posts a message to Chitter" do
    visit('/peeps/new')
    fill_in('peep', with: 'HelloWorld')
    click_button('Post Peep')

    expect(page).to have_content("HelloWorld")

  end
end