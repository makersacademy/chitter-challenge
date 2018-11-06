feature "Cheet comments" do
  scenario "I can comment on a cheet" do
    fill_in('comment', with: "I am commenting")
    click_button "Comment"
  end
end
