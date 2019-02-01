require_relative 'web_helpers'

feature 'shows peeps' do
  before do
    time_now = Time.now
    Timecop.freeze(time_now)
  end
  let(:formatted_time) { Time.now.strftime("%m/%d/%Y %H:%M") }
  scenario 'user makes two peeps' do
    sign_up
    make_a_peep("My first Peep!")
    make_a_peep('My second Peep!')
    expect(page).to have_content("My second Peep! - tomd, #{formatted_time} My first Peep! - tomd, #{formatted_time}")
  end
end
