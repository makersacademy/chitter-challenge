feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the links page' do
    Peep.new(user: 'chrisalcockdev', content: 'hello world!', created_at: '12:00')
    visit '/'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('hello world!')
    end
  end
end
