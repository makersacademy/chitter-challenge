# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Time of peep posting' do
  let(:current_time) { Time.now.strftime('%H:%M') }
  scenario "Maker can see the time a peep was posted" do

    user_sign_up_and_Peep_create_peep("I posted this peep at: ")
    
    visit('/peeps')

    expect(page).to have_content("I posted this peep at: #{current_time}")
  end
end
