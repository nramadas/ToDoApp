require 'spec_helper'

describe "Tags" do
  before { @tag = FactoryGirl.build(:tag) }

  subject { @tag }

  describe "must have a name" do
    before { @tag.tag_name = nil }

    it { should_not be_valid }
  end

  describe "can belong to tasks:" do
    before { @tag = FactoryGirl.create(:tag) }

    subject { @tag }

    it "can add tasks" do
      @tag.tasks << FactoryGirl.create(:task)
      @tag.tasks.length.should eq(1)
    end

    it "cannot belong to the same tasks more than once" do
      @task = FactoryGirl.create(:task)
      expect do
        2.times { |n| @tag.tasks << @task }
      end.to raise_error
    end

  end



end