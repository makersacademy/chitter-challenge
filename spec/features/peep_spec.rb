feature 'Peeps' do
  scenario 'A user can post a peep and view it on the homepage' do
    signup
    fill_in('peep', with: "Hello chitter")
    click_button('Peep')
    expect(page).to have_content "Hello chitter"
  end
end
