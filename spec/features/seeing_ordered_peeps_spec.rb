feature 'seeing ordered peeps' do
  scenario 'the user sees some previous peeps in time order' do
    visit '/'
    alltext = page.body
    i1 = alltext.index('I am peep 1')
    i2 = alltext.index('I am peep 2')
    i3 = alltext.index('I am peep 3')
    expect(i3 < i2).to eq true
    expect(i2 < i1).to eq true
  end
end
