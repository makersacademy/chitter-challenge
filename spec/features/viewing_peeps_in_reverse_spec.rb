feature 'Peeps are shown in reverse chronological order' do
  scenario 'User writes 3 peeps and posts them to chitter' do
    create_peep('First peep created !')
    create_peep('Second peep created !')
    create_peep('Third peep created !')
    expect(page.body.index('Third peep created !')).to be < page.body.index('Second peep created !')
    expect(page.body.index('Second peep created !')).to be < page.body.index('First peep created !')
  end
end
