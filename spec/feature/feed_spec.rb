feature "Feed Page" do
  scenario "Page loads" do
    visit '/feed'
    expect(page.status_code).to eq 200
  end

  scenario "Posts are shown on the feed page" do
    post_tweet
    # within 'ul#feed' do
      expect(page).to have_content "Hello World"
    # end
  end

  scenario "Posts shows the date of creation" do
    post_tweet
    # within 'ul#feed' do
    expect(page).to have_content {"#{DateTime.now.strftime("%d %b %Y %l:%M %p")}"}
    # end
  end
end
