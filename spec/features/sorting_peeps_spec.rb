# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Peeps display order' do
  scenario 'Makers view peeps in reverse chronological order' do
    
    user_sign_up_and_Peep_create_peep("hello")
    user_sign_up_and_Peep_create_peep("goodbye")

    visit('/peeps')

    most_recent_peep = first('.peeps').text

    expect(most_recent_peep).to include 'goodbye'
  end
end
