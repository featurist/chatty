Transform /^(Josh|Adrian)$/ do |first_name|
  persona(first_name)
end

Given(/^(.+) has logged in$/) do |persona|
  persona.login
end

When(/^(.+) posts a message$/) do |persona|
  persona.post_message "Howdy!"
end

Then(/^(.+) should see (.+)'s message$/) do |recipient, sender|
  recipient.should_see_message(sender: sender, text: "Howdy!")
end