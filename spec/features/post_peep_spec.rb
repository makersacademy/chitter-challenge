feature "FEATURE: post peep" do

  let(:name) { 'J T Kirk' }
  let(:email) { 'JTK@test.com' }
  let(:user_name) { 'TheShat' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }

  let(:peep_text) { "Second star to the right and straight on 'til morning." }

  before do
    User.create(name: name, email: email, user_name: user_name, password: password, password_confirmation: password_confirmation)
  end

  scenario "Can click to go to new peep page when logged in" do
    sign_in(email, password)
    click_link('new_peep')
    expect(page.current_path).to eq '/peeps/new'
  end

  scenario "Cannot click to add new peep when not logged in" do
    visit('/')
    expect(page).not_to have_selector("#new_peep")
  end

  scenario "Can add a new peep" do
    sign_in(email, password)
    post_peep(peep_text)
    expect(page).to have_content peep_text
  end

  scenario "Cannot add a blank peep" do
    sign_in(email, password)
    post_peep("")
    expect(page).to have_content "Peep text must not be blank"
  end

  scenario "Cannot add a peep over 250 characters" do
    sign_in(email, password)
    post_peep("This is the Captain of the Enterprise. Our respect for other life forms requires that we give you this... warning. There is one critical item of information that has never been incorporated into the memory banks of any Earth ship. Since the early years of space exploration, Earth vessels have had incorporated into them a substance known as... corbomite. It is a material and a device which prevents attack on us. If any destructive energy touches our vessel, a reverse reaction of equal strength is created, destroying -...")
    expect(page).to have_content "Peep text must be at most 250 characters long"
  end

end
