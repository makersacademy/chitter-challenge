feature "FEATURE: Creating Spits" do
  let!(:user) do
    User.create(name: 'Solid Snake',
                username: 'snake',
                email: 'snake@mgs.com',
                password: 'mgs1',
                password_confirmation: 'mgs1')
  end

  scenario "users CANNOT post Spits" do
    visit '/spits/new'
    fill_in :content, with: "Look at my dinner"
    expect{ click_button "Take a shit!" }.not_to change(Spit, :count)
    expect(page).to have_content "Only users can take a Shit"
    expect(page).to have_button "Sign in"
  end

  scenario "users CAN post Spits with username and date/time stamp" do
    sign_in(email: 'snake@mgs.com', password: 'mgs1')
    visit 'spits/new'
    fill_in :content, with: "My life is more interesting than yours"
    expect{ click_button "Take a shit!" }.to change(Spit, :count).by 1
    spit = Spit.first(content: "My life is more interesting than yours")
    within "ul#spits" do
      expect(page).to have_content "My life is more interesting than yours"
      expect(page).to have_content "Posted by #{user.username} on #{spit.created_at.strftime("%A %d %B %Y at %T ")}"
    end
  end

end
