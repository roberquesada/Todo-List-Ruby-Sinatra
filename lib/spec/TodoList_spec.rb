require_relative '../TodoList_spec.rb'


describe TodoList do

  before :each do
    @todo = TodoList.new
  end

  describe "#add_task" do
    it "Check if add 1 task" do
      @todo.add_task('New task')
      expect(@todo.tasks.length).to eq(1)
    end
  end

  describe "#delete_task" do
    it "Check if task 1 is deleted" do
      @todo.add_task('New task')
      expect(@todo.tasks.lenght).to eq(0)
    end
  end

end