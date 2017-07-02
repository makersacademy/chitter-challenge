
=begin
feature "peep is viewable" do
  scenario "user creates a peep via form" do
    post_a_peep
    expect(page).to have_css(".peeps li:first-child")
  end
end

feature "peep has a timestamp" do
  scenario "looking at peeps" do
    post_a_peep
    expect(page).to have_css('.peeps li:nth-child(1) #time')
  end
end

feature "peeps are in reverse chrono" do
   scenario "looking at peeps" do
    successive_peep_posts
    younger_peep = page.find('.peeps li:nth-child(1) #time').text
    older_peep = page.find('.peeps li:nth-child(2) #time').text
    expect(Time.parse(younger_peep)).to be > Time.parse(older_peep)
   end
end
=end
