require 'rspec'

class Task
  attr_reader :id , :content, :created_at, :update_at

  @@current_id = 1
  def initialize content
    @content = content
    @id = @@current_id
    @@current_id += 1
    @complete = false
    @created_at = Time.now.strftime "%Y-%m-%d %H:%M"
    @update_at = nil
  end

  def complete?
    @complete
  end

  def complete!
    @complete = true
  end

  def make_incomplete!
    @complete = false
  end

  def update_content! content
    @update_at = Time.now.strftime "%Y-%m-%d %H:%M"
    @content = content
  end

end