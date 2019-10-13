feature 'update photo' do
  scenario 'when i update my photo it takes me back to my profile page with the correct photo' do
    create_account
    sign_in
    click_button('View Profile')
    allow(Kernel).to receive(:rand).and_return(1)
    click_button('Change')
    expect(page).to have_css("img[src*='https://i.imgur.com/dzOMZgw.jpg']")
  end

end
