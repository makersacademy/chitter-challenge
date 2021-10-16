# frozen_string_literal: true

feature 'viewing_peeps' do
  let(:peeps_manager) { PeepsManager.new }

  scenario 'seeing all peeps in reverse chronological order' do
    peeps_manager.create_peep('first peep')
    peeps_manager.create_peep('second peep')
    peeps_manager.create_peep('third peep')

    visit('/chitter')

    expect(page.body).to match /(third peep)*(second peep)*(first peep)/m
  end

  scenario 'seeing timestamp of a peep' do
    date_time_now = '2021-10-16T16:57:38+01:00'

    allow_any_instance_of(PeepsManager)
    .to receive(:date_time_now_string)
    .and_return(date_time_now)

    peeps_manager.create_peep('Irelivant')
    visit('/chitter')

    expect(page).to have_content 'Sat Oct 16 16:57:38 2021'
  end
end
