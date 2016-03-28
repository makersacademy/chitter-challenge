feature "Create new peep" do

  before do
    register
    sign_in(email: "roxy@cat.com", password: "12345678")
    fill_in "peep", with: "Brought a bird home last night..."
    click_button "Post peep"
    @save_time = Time.now
  end

  scenario 'that shows up in feed' do
    expect(page).to have_content("roxy_cat: Brought a bird home last night...")
  end

  scenario 'peeps listed in reverse chronological order' do
    fill_in "peep", with: "You're welcome."
    click_button "Post peep"
    expect("You're welcome.").to appear_before("Brought a bird home last night...")
  end

  scenario 'displayed with time of peep' do
    expect(page).to have_content(@save_time)
  end

end
