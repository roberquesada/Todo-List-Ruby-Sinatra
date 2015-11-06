require 'sinatra'
require 'pry' if development?
require 'sinatra/reloader' if development?
require_relative('lib/Task.rb')
require_relative('lib/TodoList.rb')

todo_list = TodoList.new("Josh")
todo_list.add_task(Task.new('Test'))



get "/" do
  "Welcome to the TodoList"
end

get "/tasks" do
  @tasks = todo_list.load_tasks
  erb(:task_index)
end

get "/new_task" do
  erb(:new_task)
end


post "/create_task" do
  name = params[:name]
  task = Task.new(name)
  todo_list.add_task(task)
  redirect("/tasks")
end

get "/complete/:id" do
  id = params[:id].to_i
  task = todo_list.find_task_by_id(id)
  task.complete!
  redirect("/tasks")
end