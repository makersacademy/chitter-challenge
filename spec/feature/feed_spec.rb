require './lib/peep.rb'

feature 'feed' do
  it 'should display all peeps' do
    peeps = create_peeps
    
    visit('/feed')
    expect(page.all('.peep').count).to eq(peeps.count)
  end

  it 'should post peep to feed' do
    peeps = create_peeps
    
    visit('/feed')

    content = 'THEY TOOK OUR JORRRRRBBBSSSS!'
    fill_in('content_input', with: content)
    click_button 'Submit'

    expect(page.all('.peep').count).to eq(peeps.count + 1)
  end
end
