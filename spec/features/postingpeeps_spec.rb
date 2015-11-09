feature "Posting Peeps" do
  context "On the peeps page" do
    before do
      test_sign_up
      test_peep
    end
    scenario "I can post a Peep" do
      fill_in('peep body', with: 'test peep2')
      click_button('Post Peep')
      expect(page).to have_content('test peep2')
    end

    scenario "I can see other Peeps" do
      expect(page).to have_content('test peep')
    end

    scenario "The Peeps show who posted them" do
      within('div#peep_history') {expect(page).to have_content('from Sinatra')}
    end

  end

end