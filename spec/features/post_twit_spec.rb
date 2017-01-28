
feature "posting twits to tweeter" do
  scenario "user is logged in and posts tweet" do
    content = "build the wall, the best walls, the best, trust me"
    sign_up
    visit '/'
    click_link 'compose twit'
    expect(current_path).to eq "/twit/new"
    fill_in :content, with: content
    click_link 'twit'
    expect(current_path).to eq "/"
    expect(page).to have_content message
  end
end
