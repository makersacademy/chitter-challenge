feature 'Public Page' do 
  let(:peep_1) { 'This is my first peep! @USER_1' } 
  let(:peep_2) { 'This is my second peep! @USER_2' }
  let(:peep_3) { 'This is my third peep! @USER_3' }

  scenario 'title is shown' do 
    visit '/'
    expect(page).to have_content 'CHITTER'
  end

  scenario 'peeps are shown' do
    add_peeps
    visit '/'

    expect(page).to have_content peep_1
    expect(page).to have_content peep_2
    expect(page).to have_content peep_3
  end

  scenario 'peeps should be shown in reverse chronological order' do
    add_peeps
    visit '/'
    
    first = find('li', text: peep_1)
    second = find('li', text: peep_2)
    third = find('li', text: peep_3)

    expect(third).to appear_before(second)
    expect(second).to appear_before(first)
  end
end
