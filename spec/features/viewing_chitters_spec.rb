feature 'Viewing homepage' do 
    scenario 'visiting page shows Chitter' do
    visit('/')
    expect(page).to have_content "Chitter"
    end 
end  

feature 'Viewing peeps' do
    scenario 'User can see Peeps' do 
    visit('/Chitter')
    expect(page).to have_content "I ate a sandwich today"
    expect(page).to have_content "I love sandwiches"

    end 
end 
