require 'spec_helper'

describe "TaskPages" do
  def fill_form(num, signup=false)
    fill_in 'Name', with: "User#{num}" if signup
    fill_in 'Email', with: "user#{num}@email.com"
    fill_in 'Password', with: "12345678#{num}"
    fill_in 'Password Confirmation', with: "12345678#{num}" if signup
  end

  def create_user(num)
    visit signup_path
    fill_form(num, true)
    click_button 'Sign'
  end

  def log_in_user(num)
    visit login_path
    fill_form(num)
    click_button 'Log'
  end

  def add_task(num)
    click_link 'Add'
    fill_in 'What do you', with: "Task ##{num}"
    fill_in 'Any specifics?', with: "Specifics #{num}"
    click_button 'Create'
  end

  before do
    create_user(1)
  end

  subject { page }

  describe "can add tags" do
    before do
      click_link 'Add'
      fill_in 'Title', with: "Task #1"
      fill_in 'What do you want', with: "Specifics 1"
      fill_in 'tag', with: "Tag 1"
      click_button 'Create'
    end

    it "should add the tag to the task" do
      click_link 'edit'
      page.should have_content("Tag 1")
    end
  end
end
