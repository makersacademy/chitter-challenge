feature "posting peeps" do
  before do
    sign_up
    sign_in
  end
  scenario "a user should post a peep and have it appear on the page" do
    peep
    expect(page).to have_content("my test peep")
  end

  scenario 'peeps should say who created them' do
    peep
    expect(page).to have_content("tester")
  end

end
