feature "User peeps" do
  scenario "see all of a users peeps" do
    sign_up
    sign_in
    submit_post_1
    click_link('Megadrive')
    expect(page).to have_content('Test Post 1')
  end
end
