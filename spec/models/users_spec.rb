require 'spec_helper'

describe "Users" do
  describe "should have basic validations like" do
    before do
      @user = User.new(name: "Bob",
                       email: "bob@bob.com",
                       password: "bobbobbob",
                       password_confirmation: "bobbobbob")
    end

    subject { @user }
    
    it { should respond_to(:email) }
    it { should respond_to(:name) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:password_digest) }

    describe "checks that a password is given" do
      before { @user.password = @user.password_confirmation = '' }
      it { should_not be_valid }
    end

    describe "checks that a password is atleast 8 characters" do
      before { @user.password = @user.password_confirmation = 'bobbob'}
      it { should_not be_valid }
    end

    describe "checks that the password and confirmation match" do
      before { @user.password_confirmation = "notbob" }
      it { should_not be_valid }
    end

    describe "checks that an email is provided" do
      before { @user.email = '' }
      it { should_not be_valid}
    end

    describe "checks that an email is unique" do
      before do
        @user.save
        
        @user2 = User.new(name: "Bob",
                         email: "bob@bob.com",
                         password: "bobbobbob",
                         password_confirmation: "bobbobbob")
      end

      subject { @user2 }

      it { should_not be_valid }

    end

    describe "checks that a name is provided" do
      before { @user.name = '' }
      it { should_not be_valid}
    end
  end

  describe "can:" do
    before { @user = FactoryGirl.create(:user) }

    subject { @user }

    it "add tasks" do
      @user.tasks << FactoryGirl.create(:task)
      @user.tasks.length.should eq(1)
    end

    it "adds multiple tasks" do
      50.times { |n| @user.tasks << FactoryGirl.create(:task) }
      @user.tasks.length.should eq(50)
    end
  end
end
