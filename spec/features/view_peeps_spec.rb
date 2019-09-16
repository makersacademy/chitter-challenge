feature 'view all Peeps' do
  scenario 'A user can see all peeps on one page' do
    visit('/')

    Message.create(message:'Welcome to Chitter', title:'New tweet')
    Message.create(message:'This is my first Peep',title:'New tweet')
    Message.create(message:'Peeping to my peeps',title:'New tweet')

    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_content 'This is my first Peep'
    expect(page).to have_content 'Peeping to my peeps'
  end
end
