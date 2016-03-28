feature "Post peeps" do
  scenario "user can post a peep when logged in" do
    sign_up
    post "I have an emo nephew."
    expect(page.current_path).to eq "/peeps"
    expect(page).to have_content "I have an emo nephew."
    expect(page).to have_content "Luke @skywalker"
  end
end
