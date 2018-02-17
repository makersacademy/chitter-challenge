feature 'display peeps' do
  scenario 'show peeps in reverse order with a time stamp' do
    visit '/'
    expect(page).to have_content(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
  end
end
