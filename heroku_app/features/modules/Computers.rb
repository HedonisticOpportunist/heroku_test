# frozen_string_literal: true
require_relative '../../../common_library /logging'
require 'capybara/rspec'
# module with functions that help create, delete or update
# a computer record
module Computers
  module_function

  def add_computer
    LOG.info 'Adding a new computer record.'
    find_by_id('add', wait: 20).click
  end

  def save_computer
    LOG.info 'Clicking the create a new computer button'
    find('input.btn.primary', wait: 20).click
  end

  def fill_out_computer_details(name, introduction_date, discontinued_date, company_name)
    LOG.info 'Filling out the relevant details.'
    find_by_id('name', wait: 20).fill_in(with: name)
    find_by_id('introduced', wait: 20).fill_in(with: introduction_date)
    find_by_id('discontinued', wait: 20).fill_in(with: discontinued_date)
    select(company_name, from: 'company')
  end

  def update_name(amended_name)
    LOG.info 'Updating the company name.'
    find_by_id('name', wait: 20).fill_in(with: amended_name)
  end

  def create_computer_record(name, intro_date, discontinue_date, company_name)
    LOG.info 'Creating computer record.'
    add_computer
    fill_out_computer_details(name, intro_date, discontinue_date, company_name)
    save_computer
  end

  def delete_computer
    LOG.info('Deleting computer.')
    find('input.btn.danger', wait: 20).click
  end

  def display_message
    LOG.info 'Displaying message:'
    find('div.alert-message.warning').text
  end

  def click_record
    LOG.info 'Clicking on the record.'
    first('td a').click
  end

  def error_present
    LOG.info 'Checking that error field is present.'
    expect(page).to have_selector('div.clearfix.error', match: :first)
  end

  def search_for_computer(computer_name)
    LOG.info "Searching for #{computer_name}"
    find_by_id('searchbox', wait: 20).fill_in(with: computer_name)
    find_by_id('searchsubmit', wait: 20).click
  end

  def no_computers_found
    LOG.info 'No computers found.'
    find('section h1', wait: 20).text
  end

  def check_input(input_name, input_intro, input_discontinued)
    LOG.info 'Checking inputs'
    name = find_by_id('name', wait: 20).value
    expect(name).to eq input_name
    introduction_date = find_by_id('introduced', wait: 20).value
    expect(introduction_date).to eq input_intro
    discontinued_date = find_by_id('discontinued', wait: 20).value
    expect(discontinued_date).to eq input_discontinued
  end
end
