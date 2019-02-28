feature 'feed' do
  it 'should display all peeps' do
    visit('/feed')
    expect(page.find('.peeps').count).to eq(2)
  end
end