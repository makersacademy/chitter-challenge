feature 'Posting peeps' do
  scenario 'An aunthenticated user can post a new peep' do
    create_account('Chet', 'chet@chitter.com', 'the_real_chet', 'cutthechatterred2')
    expect(current_path).to eq '/'
    fill_in(:compose_peep, with: 'Just signed up for Chitter! #firstpeep')
    click_button('Peep')
    expect(page).to have_content('Just signed up for Chitter! #firstpeep')
  end
end