feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario 'A maker can see peeps' do
    @time_now = Time.new(2020, 12, 01)
    allow(Time).to receive(:now).and_return(@time_now)
    # Add the test data
    Peep.create(script: 'This is my first peep', created_at: Time.now)
    Peep.create(script: 'Why have you used my identity?', created_at: Time.now)

    visit('/peeps')

    expect(page).to have_content 'This is my first peep'
    expect(page).to have_content 'Why have you used my identity?'
    expect(page).to have_content '2020-12-01 00:00:00'
  end

  scenario 'A maker can see who has posted the peep' do
    # Add the test data
    Peep.create(script: 'This is my first peep', created_at: Time.now)

    visit('/peeps')

    expect(page).to have_content 'Guest'
  end
end
