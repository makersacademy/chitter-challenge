feature 'Peep' do
  scenario 'user is able to publish a peep' do
    sign_up
    post_peep "Test peep"
    expect(page).to have_content "Test peep"
  end
end
