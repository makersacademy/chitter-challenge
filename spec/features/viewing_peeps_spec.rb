feature "View list of peeps" do

  scenario "User can view peeps in wesbite" do
    sign_up
    sign_in
    post_peep
    visit '/chitter'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Peeping!')
    end
  end

end
