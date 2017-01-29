# User Story Five
#
# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'see time of peep' do

  scenario 'see the time at which the peep was made' do
    text = 'Sample text.'
    allow(Time).to receive(:new).and_return(Time.new(2017, 1, 29, 16, 05, 00))
    post(text)
    expect(page).to have_content 'Published on: 04:05PM, 29 Jan 2017'
  end
end
