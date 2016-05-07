feature 'posting peeps' do
  scenario "non-users can't post peeps" do
    visit '/peep/new'
    fill_in :content, with: "Look at my dinner...."
    expect{click_button 'peep'}.not_to change(Peep, :count)
    expect(page).to have_content "only users can peep"
    expect(page).to have_content "log in here"
  end

  scenario 'peeps posted by users are time stamped and show username' do
    sign_in
    visit '/peep/new'
    fill_in :content, with: "My life is sooooo interesting"
    expect{click_button 'peep'}.to change(Peep, :count).by 1
    peep = Peep.first(content: "My life is sooooo interesting")
    within "ul#peeps" do
      expect(page).to have_content "My life is sooooo interesting"
      expect(page).to have_content "MacDaNNy"
      expect(page).to have_content peep.created_at
    end
  end


  xscenario "max peep length of 144 chars" do
    # peep = 'p' * 144
    # sign_in
    # visit '/peep/new'
    # fill_in :content, with: peep
    # expect{click_button 'peep'}.to change(Peep, :count).by 1
  end
end
