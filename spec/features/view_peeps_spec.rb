feature 'viewing peeps' do
  scenario 'peeps are listed in reverse chronological order' do
    visit('/')
    fill_in('content', with: 'Hello, world')
    click_on 'Submit'
    visit('/')
    fill_in('content', with: 'Goodbye, world')
    click_on 'Submit'
    expect(page.body.index('Goodbye, world')).to be < page.body.index('Hello, world')
  end
end
