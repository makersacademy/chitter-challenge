feature 'Posting' do
  scenario 'A user can post/create a new peep' do
    visit('/signup')
    signup

    fill_in('content', with: "This is an automated peep")
    click_button('Cheet')

    expect(page).to have_content("This is an automated peep")
  end
end
