feature "Feed Page" do
  scenario "Page loads" do
    visit '/feed'
    expect(page.status_code).to eq 200
  end

  scenario "Posts are shown on the feed page" do
    visit '/feed'
    fill_in :tweet, with: 'Hello World'
    click_button 'Tweet!'
    within 'ul#feed' do
      expect(page).to have_content "Hello World"
    end
  end
end
