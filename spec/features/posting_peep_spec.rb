feature 'Posting peeps' do
  scenario 'user makes a peep and sees it' do
    user = create(:user)
    sign_in(user)
    fill_in(:peep, with: 'Test peep!')
    click_button('Peep!')
    expect(page.status_code).to be 200
    expect(page).to have_content "Test peep!"
    expect(Peep.all.count).to be 1
    expect(page).to have_content "adilw3nomad peeped:"
  end
end
