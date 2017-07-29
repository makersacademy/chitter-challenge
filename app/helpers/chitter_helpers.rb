module ChitterHelpers
   def current_user
     @current_user ||= User.get(session[:user_id])
   end

   def search(words)
       search_words = words.split(" ").map { |word| word.downcase }
       result = []
       search_words.each do |word|
         Peep.all.each { |peep| result << peep if peep.content.downcase.include? word }
       end
       if result.empty?
         flash.now[:notice] = "No peeps found for \"" + params[:search] + "\""
         return Peep.all
       end
       result
   end

   def create_peep(params)
     peep = Peep.new(content: params[:peep_content], user_id: current_user.id)
     tags = params[:tags]
     tags.split(" ").each do |tag|
       search = User.first(:username => tag)
       if search
         email(search.email, "Chitter: #{search.username} tagged you in a peep!", "Go to Chitter to see it.")
       end
       tag  = Tag.first_or_create(name: tag)
       peep.tags << tag
     end
     peep.save
   end

   def email(email, subject, message)
     Mail.deliver do
       from    'no-reply@chitter.com'
       to      email
       subject subject
       body    message
     end
   end
end
