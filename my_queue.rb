class My_Queue
  def initialize
    @store = []
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def enqueue(item)
    @store.push(item)
  end

  def dequeue
    @store.shift
  end

end