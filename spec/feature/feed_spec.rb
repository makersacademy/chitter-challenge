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
    time = Time.now
    time = time.strftime("%H:%M")
    within 'ul#feed' do
      expect(page).to have_content time
    end
  end
end
