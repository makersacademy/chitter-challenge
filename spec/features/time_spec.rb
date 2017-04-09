require 'timecop'

feature 'Time' do

  before do
    Timecop.freeze(Time.new(2017, 1, 29, 13, 0, 0))
  end
  scenario 'DateTime meow was sent will be displayed with meow' do

    visit '/meows/new'
    fill_in(:message, with: 'Cat')
    click_button('Send meow!')
    expect(page).to have_content '2017-01-29T13:00:00'
  end



  scenario 'Meows will be listed in reverse chronological order' do

  end





end
