require 'rspec'

class TodoList
    attr_reader :tasks
    def initialize
        @tasks = []
    end

    def add_task param
      @tasks << param
    end

    def delete_task param

    end
end