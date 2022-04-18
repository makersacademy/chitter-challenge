feature "Empty Post" do
  it "won't allow the user to post an empty peep" do
    signup_and_login
    click_button 'Post'
    expect(page).not_to have_css('dd.list', text: "")
  end
end
