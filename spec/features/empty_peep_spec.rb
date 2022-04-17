feature "Empty Post" do
  it "won't allow the user to post an empty peep" do
    visit '/peeps'
    click_button 'Post'
    expect(page).not_to have_css('li.list', text: "")
  end
end
