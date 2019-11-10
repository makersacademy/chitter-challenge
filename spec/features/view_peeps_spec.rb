feature 'viewing peeps' do
  scenario 'peeps are listed in reverse chronological order' do
    visit('/')
    click_link 'New peep'
    fill_in('content', with: 'Hello, world')
    click_on 'Submit'
    click_link 'New peep'
    fill_in('content', with: 'Goodbye, world')
    click_on 'Submit'
    expect(page.body.index('Goodbye, world')).to be < page.body.index('Hello, world')
  end

  scenario 'peeps are listed with their timestamps' do
    allow(DateTime).to receive(:now).and_return(DateTime.new(2019, 11, 10, 15))
    visit('/')
    click_link 'New peep'
    fill_in('content', with: 'Hello, sunshine')
    click_on 'Submit'
    expect(page).to have_content 'Hello, sunshine (15:00 10 Nov 2019)'
  end
end
