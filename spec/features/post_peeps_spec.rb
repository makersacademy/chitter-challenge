feature "Post peeps" do
  scenario "user can post a peep when logged in" do
    sign_up
    visit "/peeps/new"
    fill_in :content, with: "I have an emo nephew."
    click_button "Peep!"
    expect(page.current_path).to eq "/peeps"
    expect(page).to have_content "I have an emo nephew."
    expect(page).to have_content "posted by Luke(@skywalker)"
  end
end
