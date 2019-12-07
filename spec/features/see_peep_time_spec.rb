feature "See peep's time" do
  scenario "A maker can see the time at which a peep was made" do
    post_time = Time.new(2019, 02, 24, 12, 0, 0, "+00:00")
    Timecop.freeze(post_time)
    visit "/peeps/new"
    fill_in "content", with: "First peep"
    click_button "Post"

    expect(current_path).to eq "/peeps"
    expect(page).to have_content "2019-02-24 12:00:00"
  end
end

# post_time = Time.httpdate("Thu, 06 Oct 2011 02:26:12 GMT")
# Time.now.strftime("%F %T")
