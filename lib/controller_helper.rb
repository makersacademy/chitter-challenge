# keeping controllers slim
def condition(email, password, user)
  redirect '/' if email == ""
  redirect '/' if password == ""
  redirect '/' if user == ""
end
