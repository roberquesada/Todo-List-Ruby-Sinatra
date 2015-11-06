require_relative '../Task.rb'

describe Task do

  before :each do
    @task = Task.new('New task')
  end

  describe "#initialize" do
    it "Check attribute id is equal 1" do
      expect(@task.id).to eq(1)
    end

    it "Check attribute id is equal 2" do
      expect(@task.id).to eq(2)
    end

    it "Check created time task" do
      expect(@task.created_at).to eq(Time.now.strftime "%Y-%m-%d %H:%M")
    end

    it "Check if update time task is nill" do
      expect(@task.update_at).to eq(nil)
    end 

  end

  describe "#complete?" do
    it "Check if task is false" do
      expect(@task.complete?).to be_falsey
    end
  end

  describe "#complete!" do
    it "Check if task is true" do
      @task.complete!
      expect(@task.complete?).to be_truthy
    end
  end

  describe "#make_incomplete!" do
    it "Change task to false" do
      @task.make_incomplete!
      expect(@task.complete?).to be_falsey
    end
  end

  describe "#update_content!" do
    it "Content was update" do
      expect(@task.update_content!("Content changed")).to eq("Content changed")
    end

    it "Current update is equal to current time" do
      @task.update_content!('')
      expect(@task.update_at).to eq(Time.now.strftime "%Y-%m-%d %H:%M")
    end

  end

end