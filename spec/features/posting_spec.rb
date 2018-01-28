feature 'posting peeps' do
  scenario 'user can post a peep to the main page' do
    sign_up
    expect(page.status_code).to eq 200
    fill_in 'message', with: "Huzzah!!!"
    click_button 'Submit'
    expect(page).to have_content("Huzzah!!!")
  end
end
