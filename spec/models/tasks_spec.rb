require 'spec_helper'

describe "Tasks" do
  before { @task = FactoryGirl.build(:task) }
  
  subject { @task }

  describe "must have a title" do
    before { @task.title = nil }

    it { should_not be_valid }
  end

  describe "must have a body" do
    before { @task.body = nil }

    it { should_not be_valid }
  end

  describe "must be assigned to a user" do
    before { @task.user_id = nil }

    it { should_not be_valid }
  end
end
