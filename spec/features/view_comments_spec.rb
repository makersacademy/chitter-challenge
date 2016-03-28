feature "View comments" do
    before do
      sign_up
      post "I have an emo nephew."

      allow(Time).to receive(:now).and_return(earlier)
      click_link "Comments"
      add_comment "That really sucks."

      allow(Time).to receive(:now).and_return(later)
      add_comment "Meh"
    end

    scenario "show comments of a peep in reverse chronological order" do
      visit "/"
      click_link "Comments"
      expect(page.current_path).to eq "/#{Peep.last.id}/comments"

      within "ul li.comment:first-child" do
        expect(page).to have_content "Meh"
        expect(page).to have_content "14:59 26/03/2016"
      end

      within "ul li.comment:last-child" do
        expect(page).to have_content "That really sucks."
        expect(page).to have_content "14:58 26/03/2016"
      end
    end
end
