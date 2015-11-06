require 'pry'
require 'yaml/store'

module ManageData
  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end

  def load_tasks
     @tasks
  end  
end

class TodoList
  attr_reader :tasks, :user
  include ManageData

  def initialize user_name
    @file_url = './public/tasks.yml'
    @todo_store = YAML::Store.new(@file_url)
    @tasks = []
    @user = user_name
  end

  def add_task task
    @tasks << task
  end

  def delete_task task_id
    @tasks.delete_if { |task| task.id == task_id }
  end

  def find_task_by_id task_id
    @tasks.find { |task| task.id == task_id }
  end

  def sort_by_created order_by = "DESC"
    if(order_by == "DESC")
      @tasks.sort do | task1, task2 |
        task2.created_at <=> task1.created_at
      end
    elsif(order_by == "ASC")
      @tasks.sort do | task1, task2 |
        task1.created_at <=> task2.created_at
      end
    end
  end

  
end