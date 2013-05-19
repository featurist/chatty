require 'rest-client'

When(/^a post is created via an HTTP POST$/) do
  post = {
    user: { name: { givenName: 'Happy', familyName: 'Gilmore' } },
    text: 'Tappa tappa tappa'
  }
  RestClient.post "http://localhost:3000/post", post.to_json, {
    "Content-Type" => "application/json"
  }
end

Then(/^I should see the post$/) do
  persona("Josh").should_see_message(sender: "Happy", text: 'Tappa tappa tappa')
end