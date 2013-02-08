require 'spec_helper'

describe "Sessions" do
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

  def log_out
    click_link 'Logout'
  end

  before do
    create_user(1)
    log_out
  end

  describe "login possible:" do
    before { visit login_path }

    subject { page }

    it { should have_content("Email") }
    it { should have_content("Password") }

    it "logs in:" do
      fill_form(1)
      click_button 'Log'
      page.should have_content("User1")
    end

    it "does not let you visit user pages without login" do
      visit user_path(User.first)
      page.should have_content("Log")
    end

    it "does not let you visit other user pages without proper authentication" do
      create_user(2)
      log_out
      visit login_path
      fill_form(1)
      visit user_path(User.last)

      page.should have_content("Log")
    end
  end
end
