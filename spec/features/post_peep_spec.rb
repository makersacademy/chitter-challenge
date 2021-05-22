feature "posting a message" do
  scenario "I can post a peep on chitter" do
    visit ('/')
    click_button('Post')
    fill_in('Message', with: 'Going to the beach today!')
    expect(page).to have_content('Going to the beach today!')
  end
end