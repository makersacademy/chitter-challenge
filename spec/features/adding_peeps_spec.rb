require 'peep'

feature 'User adds a peep' do
  scenario 'when browsing the homepage' do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep('Hello world', '#firstpeep')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.content).to eq('Hello world')
    expect(peep.hashtag).to eq('#firstpeep')
  end

  def add_peep(content, hashtag)
    within('#new-peep') do
      fill_in 'content', with: content
      fill_in 'hashtag', with: hashtag
      click_button 'Peep'
    end
  end
end