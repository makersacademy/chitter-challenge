require_relative 'web_helper'
require 'date'

feature 'feed' do
  before(:each) { @peeps = visit_feed_that_has_peeps }

  it 'should display all peeps' do
    expect(page.all('.peep').count).to eq(@peeps.count)
  end

  it 'should post peep to feed' do
    content = 'THEY TOOK OUR JORRRRRBBBSSSS!'
    fill_in('content_input', with: content)
    click_button 'Submit'

    expect(page.all('.peep').count).to eq(@peeps.count + 1)
  end

  it 'should display time when peep was posted' do
    content = 'THEY TOOK OUR JORRRRRBBBSSSS!'
    fill_in('content_input', with: content)
    click_button 'Submit'

    displayed_peep = page.find("##{@peeps[0].id}")
    p @peeps[0].created_at

    expected_post_time = @peeps[0].created_at.strftime(
      '%e %b %Y %H:%M:%S%p'
    )

    expect(displayed_peep).to have_content(expected_post_time)
  end
end
