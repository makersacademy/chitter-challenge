# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Time of peep posting' do
  let(:current_time) { Time.now.strftime('%H:%M') }
  scenario "Maker can see the time a peep was posted" do
    sign_up_helper
    visit('/peeps/new-peep')
    fill_in 'message', with: 'I posted this peep at:'
    click_button('submit')
    expect(page).to have_content("I posted this peep at: #{current_time}")
  end
end
