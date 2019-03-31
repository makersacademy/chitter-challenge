feature 'peeps in reverse chronological order' do
  scenario 'all peeps are presented in reverse chronological order' do
    peep1 = Peep.create(content: 'This is the first peep')
    peep2 = Peep.create(content: 'This is the second peep')
    visit('/chitter')
    expect(peep2.content).to appear_before peep1.content
  end
end

feature 'show time peep posted' do
  scenario 'time that peep was posted is displayed' do
    allow(Time).to receive(:now).and_return(Time.parse("2019-03-31 13:35:10 +0100"))
    Peep.create(content: 'Testing time view peep')
    visit('/chitter')
    expect(page).to have_content('Testing time view peep 13:35, 31 March')
  end
end
