    require 'sendgrid-ruby'
    include SendGrid
    
    from = SendGrid::Email.new(email: ENV["FROM"])
    to = SendGrid::Email.new(email: ENV["TO"])
    subject = ENV["HEADER"]
    content = SendGrid::Content.new(type: 'text/plain', value: ENV["CONTENT"])
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV["KEY"])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    puts response.status_code
    puts response.body
    puts response.headers