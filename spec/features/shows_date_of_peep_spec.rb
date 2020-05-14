feature 'date of peep' do
  before do
    @time_now = Time.parse('01/01/2020 12:12')
    allow(Time).to receive(:now).and_return(@time_now)
  end

  scenario 'shows the date the peep was made' do
    login
    add_peep('This is a peep')
    expect(first('.peep')).to have_content '01/01/2020 12:12'
  end
end
