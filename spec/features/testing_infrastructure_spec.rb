feature 'testing infrastructure' do
  scenario 'root has a page title' do

    visit '/'
	expect(page).to have_title "low rent twitter"
    
  end
end 