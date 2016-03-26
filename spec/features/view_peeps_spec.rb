feature "View peeps" do
  before do
    sign_up
    post "I have an emo nephew."
    post "I love flying!"
  end

  scenario "show peeps in reverse chronological order" do
    within "li:first-child" do
      expect(page).to have_content "I love flying!"
    end

    within "li:last-child" do
      expect(page).to have_content "I have an emo nephew."
    end
  end
end
