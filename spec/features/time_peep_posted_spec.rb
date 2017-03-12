# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'so that users can better appreciate the context of a peep' do
  include Helpers
  
  scenario 'a user wants to see the time which it was made' do
    visit '/'
    sign_up
    first_peep
    time = Time.now.to_s[0..15].sub! "T", " "
    expect(page).to have_content "First peep! #{time}"
  end
end
