feature "Time" do
  scenario "the time a peep was made is displayed" do
    signup_and_login
    fill_in 'description', with: "This is a test peep"
    click_button 'Post'
    peep = Peep.first
    expect(first('.details')).to have_content peep.format_time.to_s
  end
end
