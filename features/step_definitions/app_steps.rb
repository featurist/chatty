Transform /^(Josh|Adrian)$/ do |first_name|
  persona(first_name)
end

Given(/^(.+) has logged in$/) do |persona|
  persona.login
end

When(/^(.+) posts a message$/) do |persona|
  persona.post_message "Howdy!"
end

When(/^(.+) disconnects$/) do |persona|
  persona.disconnect
end

Then(/^(.+) should see (.+)'s message$/) do |recipient, sender|
  recipient.should_see_message(sender: sender, text: "Howdy!")
end

Given(/^I have logged in$/) do
  step "Josh has logged in"
end

When(/^I post a message$/) do
  step "Josh posts a message"
end

When(/^I reload my client$/) do
  persona("Josh").visit '/'
end

Then(/^I should see the message I posted$/) do
  step "Josh should see Josh's message"
end

Then(/^(.+) should see (.+)'s avatar$/) do |me, them|
  me.should_see_avatar(them)
end

Then(/^(.+) should not see (.+)'s avatar$/) do |me, them|
  sleep 1
  me.should_not_see_avatar(them)
end