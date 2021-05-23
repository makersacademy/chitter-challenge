feature 'Viewing peeps' do
  scenario "'/' route redirects to '/peeps'" do
    visit '/'
    expect(current_path).to eq('/peeps')
  end

  scenario 'A user can view peeps' do
    now = Time.now.strftime("%F %T")
    Peep.create(text: 'test peep 1', posted: now)
    Peep.create(text: 'test peep 2', posted: now)
    Peep.create(text: 'test peep 3', posted: now)

    visit '/peeps'

    expect(page).to have_content("test peep 1\n#{now}")
    expect(page).to have_content("test peep 2\n#{now}")
    expect(page).to have_content("test peep 3\n#{now}")
  end

  scenario 'Peeps should be shown in reverse chronological order' do
    now = Time.now
    before = Time.now - 3600
    yesterday = Time.now - 86400
    Peep.create(text: 'test peep 1', posted: now.strftime("%F %T"))
    Peep.create(text: 'test peep 3', posted: yesterday.strftime("%F %T"))
    Peep.create(text: 'test peep 2', posted: before.strftime("%F %T"))

    visit '/peeps'

    peeps = page.all('.peep')
    expect(peeps[0]).to have_content(now.strftime("%F %T"))
    expect(peeps[1]).to have_content(before.strftime("%F %T"))
    expect(peeps[2]).to have_content(yesterday.strftime("%F %T"))
  end
end