feature 'can see peeps' do
  doubles
  let(:time) { Time.now.strftime("%H:%M") }
  let(:date) { Time.now.strftime("%d/%m/%y")}

  scenario 'user sees peeps displayed on homepage' do
    peep
    expect(page).to have_content 'First peep!'
  end

  scenario 'shows owner of peep' do
    peep
    expect(page).to have_content "#{maker.username} peeped"
  end

  scenario 'guest cannot peep' do
    visit '/'
    click_button "Read peeps as Guest"
    expect(page).not_to have_field 'What will you peep about today?'
  end

  scenario 'peep has timestamp' do
    peep
    expect(Peep.first.time).to include time
  end

  scenario 'peep has timestamp' do
    peep
    expect(Peep.first.date).to include date
  end
end
