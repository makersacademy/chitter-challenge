require_relative './helpers/sign_in'
feature "posting a message" do
  scenario "I can post a peep on chitter" do
    sign_in_short_cut
    click_button('Post')
    fill_in('message', with: 'Going to the beach today!')
    click_button('Submit')
    expect(page).to have_content('Going to the beach today!')
  end
end
