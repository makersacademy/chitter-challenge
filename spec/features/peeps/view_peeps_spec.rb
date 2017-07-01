

feature "peep generation" do
  scenario "user creates a peep via form" do
    post_a_peep
    expect(page).to have_css(".peeps li:first-child")
  end
end

feature "view all peeps in reverse chrono" do
   scenario "user visits peep index page" do
    successive_peep_posts
    younger_peep = page.find('.peeps li:nth-child(1) #time').text
    older_peep = page.find('.peeps li:nth-child(2) #time').text
    expect(Time.parse(younger_peep)).to be > Time.parse(older_peep)
   end
end
