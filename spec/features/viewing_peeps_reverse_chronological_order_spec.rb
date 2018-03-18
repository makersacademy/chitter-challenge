feature 'Peeps are shown in reverse chronological order' do
  scenario 'user can see peeps in order on homepage' do
    visit '/'
    text = page.body
    index1 = text.index('DataMapper test1')
    index2 = text.index('DataMapper test2')
    index3 = text.index('DataMapper test3')
    expect(index3 < index2).to eq true
    expect(index2 < index1).to eq true
  end
end
