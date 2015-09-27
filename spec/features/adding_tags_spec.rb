feature 'Adding tags' do

  scenario 'I can add a single tag to a new chit' do
    visit '/chits/new'
    fill_in 'post',   with: 'going to the rugby'
    fill_in 'tag',  with: 'fun'

    click_button 'Post chit'
    chit = Chit.first
    expect(chit.tags.map(&:name)).to include('fun')
  end

end
