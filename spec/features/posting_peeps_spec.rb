feature 'Peeps' do
  scenario 'posting a new peep' do
    sign_up
    post_a_peep
    within "ul#peeps" do
      expect(page).to have_content "This is a peep"
    end
  end

  scenario 'doesn\'t let post a peep if not logged in' do
    visit visit '/peeps/new'
    expect(page).not_to have_content "New Peep"
  end



end
