def signup
  visit '/users/new'
  fill_in('username', with: 'Miko')
  fill_in('email', with: 'miko@o2.pl')
  fill_in('password', with: 'gweatonidas36')
end
