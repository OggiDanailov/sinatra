require 'sendgrid-ruby'
include SendGrid

from = Email.new(email: 'ogidan@abv.bg')
subject = 'Hello World from the SendGrid Ruby Library!'
to = Email.new(email: 'ogidan@abv.bg')
content = Content.new(type: 'text/plain', value: 'Whatever')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers