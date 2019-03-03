require "time"
feature "The time in which the posts are made is shown" do
  scenario "The time of making a post will be written on the main page" do
    visit "/posts"
    click_button "New post"
    fill_in "text",with: "This is a text"
    current_time = Time.now()
    click_button "Submit"
    expect(page).to have_content "#{current_time}"[0..-7]
  end
end
