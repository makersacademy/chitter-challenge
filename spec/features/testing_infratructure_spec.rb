feature 'visiting homepage' do
scenario 'checking test infrastrucutre working' do
visit('/')
expect(page).to have_content "Hello World"
end
end