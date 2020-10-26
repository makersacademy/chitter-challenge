feature 'Seeing Timestamps on Peeps' do
  scenario 'peeps include timestamps' do
    sign_in_and_peep
    time = parsed_time_now
    peep = first('.peep')
    expect(peep).to have_content(time)
  end
end
