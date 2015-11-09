feature "peeps are listed" do
  scenario "in reverse chronological order" do
    valid_sign_up
    post_a_peep_1; post_a_peep_2; post_a_peep_3
    within(:css, "ul#peeps li:eq(1)") do
      expect(page).to have_content 'Come and join Chitter!'
    end
    within(:css, "ul#peeps li:eq(2)") do
      expect(page).to have_content 'I love peeping!'
    end
    within(:css, "ul#peeps li:eq(3)") do
      expect(page).to have_content "I'm creating an app called Chitter!"
    end
  end
end
