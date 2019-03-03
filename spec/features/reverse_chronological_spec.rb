feature "The posts will be printed in reverse chronological order" do
  scenario " The posts are printed in reverse chronologial order" do
    visit "/posts"
    click_button "New post"
    fill_in "text", with:"The sooner post"
    click_button "Submit"
    click_button "New post"
    fill_in "text", with:"The later post"
    click_button "Submit"
    expect(page.find('li:nth-child(1)')).to have_content "The sooner post"
    expect(page.find('li:nth-child(2)')).to have_content "The later post"
    expect(page).to have_content 'The later post'
    expect(page).to have_content 'The sooner post'
  end
end
