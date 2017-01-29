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
    click_link('new_peep')
    fill_in :peep_text, with: peep_text
    click_button('submit_peep')
    expect(page).to have_content peep_text
  end

  scenario "Cannot add a blank peep" do
    sign_in(email, password)
    click_link('new_peep')
    fill_in :peep_text, with: ""
    click_button('submit_peep')
    expect(page).to have_content "Peep text must not be blank"
  end

end
