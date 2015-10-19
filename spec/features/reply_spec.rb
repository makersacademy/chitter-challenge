require 'spec_helper'

feature 'Users reply to peeps' do

  scenario 'I am reply to any peep' do
    user1 = create :user
    user2 = create(:user, name: 'Danlu Wang', username: 'danluwang', email: 'lulu@gmail.com')
    sign_in(user1)
    expect(page).to have_content "Welcome to Chitter, Joe Zhou @joema!"
    expect(User.first.email).to eq "joe@ma.com"
    time = Time.new
    creation_time = "Peeped on #{time.day}-#{time.month}-#{time.year}"
    visit '/peeps/new'
    fill_in :content, with: "Hello world!"
    expect {click_button("Post new peep")}.to change(Peep, :count).by(1)
    expect(current_path).to eq('/peeps')
    expect(page).to have_content("Hello world!")
    expect(page).to have_content('Joe Zhou')
    expect(page).to have_content('joema')
    expect(page).to have_content(creation_time)
    click_button("Sign out")
    sign_in(user2)
    expect(page).to have_content "Welcome to Chitter, Danlu Wang @danluwang!"
    visit "/peeps"
    click_link('reply')
    expect(current_path).to eq('/replies/new')
    fill_in :reply_content, with: "This is a reply to a peep."
    click_button("Reply")
    expect(current_path).to eq('/peeps')
    expect(page).to have_content("This is a reply to a peep.")
  end

end
