feature 'testing infrastructure' do
  scenario 'root check' do
    visit '/'
	expect(page).to have_link('Enter Chitter', href: '/chitter')
  end
end 