require 'spec_helper'

describe "Tasks" do
  before { @task = FactoryGirl.build(:task) }
  
  subject { @task }

  describe "must have a title" do
    before { @task.title = nil }

    it { should_not be_valid }
  end

  describe "must be assigned to a user" do
    before { @task.user_id = nil }

    it { should_not be_valid }
  end

  describe "can have tags:" do
    before { @task = FactoryGirl.create(:task) }

    subject { @task }

    it "adding a tag should increment tag count by one" do
      @task.tags << FactoryGirl.create(:tag)
      @task.tags.length.should eq(1)
    end

    it "adding the same tage should not be valid" do
      @tag = FactoryGirl.create(:tag)
      expect do
        2.times { |n| @task.tags << @tag }
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
