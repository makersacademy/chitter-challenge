feature "list of peeps" do
  scenario "display the times they were posted" do
    valid_sign_up
    post_a_peep_1
    within(:css, "ul#peeps li:eq(1)") do
      expect(page).to have_content 'just now'
    end
  end
end
