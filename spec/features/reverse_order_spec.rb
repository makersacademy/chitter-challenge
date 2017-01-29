# User Story Five
#
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'see all peeps' do
  scenario 'see peeps in reverse chronological order' do
    earlier_text = 'Earlier peep.'
    post(earlier_text)

    later_text = 'Later peep.'
    post(later_text)
    
    expect(first('.peep')).to have_content later_text
  end
end
