feature 'Post a peep' do
  scenario 'post a peep and see it on the home screen' do
    sign_in
    fill_in 'peep', with: "This is a test peep"
    click_button "peep"
    expect(page).to have_content "This is a test peep"
  end
end
