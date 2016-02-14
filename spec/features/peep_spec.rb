feature 'Peeps' do
  scenario 'A user can post a peep and view it on the homepage' do
    signup
    fill_in('peep', with: "Hello chitter")
    click_button('Peep')
    expect(page).to have_content "Hello chitter"
  end

  scenario 'A user posts a peep and he can see that it\'s from him' do
    signup
    fill_in('peep', with: "Hello chitter")
    click_button('Peep')
    expect(page).to have_content "Alex peeped:"
  end

end
