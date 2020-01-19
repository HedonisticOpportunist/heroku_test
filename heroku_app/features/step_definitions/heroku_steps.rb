# frozen_string_literal: true
require_relative '../../../heroku_app/features/modules/Computers'
include Computers

Given(/^I am on the computer database main page$/) do
  LOG.info 'Getting to the main page.'
  visit('http://computer-database.herokuapp.com/computers')
  expect(page).to have_title 'Computers database'
end

When(/^I add a new computer$/) do
  LOG.info 'Adding a new computer record.'
  add_computer
end

And(/^I add its "([^"]*)", "([^"]*)" "([^"]*)" and its "([^"]*)"$/) do |name, intro, discontinued_date, company_name|
  fill_out_computer_details(name, intro, discontinued_date, company_name)
end

And(/^I click on the create button$/) do
  save_computer
end

Then(/^a message should be displayed that the computer "([^"]*)" has been created$/) do |name|
  expect(display_message).to eq "Done! Computer #{name} has been created"
end

Given(/^I create a record with the details "([^"]*)", "([^"]*)" "([^"]*)" and "([^"]*)"$/) do |name, introduction_date, discontinued_date, company_name|
  create_computer_record(name, introduction_date, discontinued_date, company_name)
end

When(/^I click on the delete button$/) do
  include Computers
  delete_computer
end

Then(/^a message should be displayed that the computer has been deleted$/) do
  expect(display_message).to eq 'Done! Computer has been deleted'
end

And(/^I search for a computer using its "([^"]*)"$/) do |name|
  search_for_computer(name)
  click_record
end

When(/^I update its name to "([^"]*)"$/) do |new_name|
  update_name(new_name)
end

And(/^click on the save button$/) do
  save_computer
end

Then(/^a message should be displayed that the computer "([^"]*)" has been updated$/) do |name|
  expect(display_message).to eq "Done! Computer #{name} has been updated"
end

Then(/^an error message should be displayed$/) do
  error_present
end

Then(/^I should get a message that no computers have been found$/) do
  expect(no_computers_found).to eq 'No computers found'
end

When(/^I search for a computer using an invalid "([^"]*)"$/) do |name|
  search_for_computer(name)
end

Then(/^its "([^"]*)", "([^"]*)" and "([^"]*)" should match the test input$/) do |name, introduction_date, discontinued_date|
  check_input(name, introduction_date, discontinued_date)
end