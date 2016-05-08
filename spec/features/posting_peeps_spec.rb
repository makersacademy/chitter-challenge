feature 'posting peeps' do
  scenario 'users can create peeps' do
    sign_in
    visit '/peep/new'
    fill_in :content, with: "My life is sooooo interesting"
    expect{click_button 'peep'}.to change(Peep, :count).by 1
    peep = Peep.first(content: "My life is sooooo interesting")
  end

  scenario "non-users can't" do
    visit '/peep/new'
    fill_in :content, with: "Look at my dinner...."
    expect{click_button 'peep'}.not_to change(Peep, :count)
    expect(page).to have_content "only users can peep"
    expect(page).to have_content "log in here"
  end
  
  xscenario "max peep length of 144 chars" do
    # peep = 'p' * 144
    # sign_in
    # visit '/peep/new'
    # fill_in :content, with: peep
    # expect{click_button 'peep'}.to change(Peep, :count).by 1
  end
end
