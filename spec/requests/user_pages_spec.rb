require 'spec_helper'

describe "UserPages" do
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
    fill_in 'Title', with: "Task ##{num}"
    fill_in 'What do you want', with: "Specifics #{num}"
    click_button 'Create'
  end

  describe "can sign a user up:" do
    before { visit signup_path }

    subject { page }

    it { should have_content("Name") }
    it { should have_content("Email") }
    it { should have_content("Password") }
    it { should have_content("Password Confirmation") }

    it "successfully signs users up" do
      create_user(1)

      User.all.length.should eq(1)
    end

    it "doesn't sign the same user twice" do
      create_user(1)

      expect do
        create_user(1)
      end.to raise_error
    end
  end

  describe "show page:" do
    before { create_user(1) }

    subject { page }

    it { should have_content("Add") }
    it { should have_content("want to get done") }

    it "should add tasks" do
      add_task(1)
      page.should have_content("Task #1")
      page.should have_content("i got this")
    end

    it "allows you to edit tasks" do
      add_task(1)
      click_link "edit"
      page.should have_content("Edit")
    end

    it "allows you to complete tasks" do
      add_task(1)
      click_link "i got this"
      page.should_not have_content("Task #1")
    end
  end
end
