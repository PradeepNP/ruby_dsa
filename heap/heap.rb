class Heap
    attr_accessor :heap_container
    def initialize()
      self.heap_container = []
    end
  
    def add(item)
      self.heap_container.push(item)
      self.heapify_up()
    end
    
    def get_left_child_index(index)
      return (2 * index) + 1
    end
  
    def get_right_child_index(index)
      return (2 * index) + 2
    end
  
    def get_parent_index(child_index)
      return ((child_index - 1)/2)
    end
  
    def has_parent(child_index)
      return self.get_parent_index(child_index) >= 0
    end
  
    def has_left_child(parent_index)
      return self.get_left_child_index(parent_index) < self.heap_container.size
    end
  
    def has_right_child(parent_index)
      return self.get_right_child_index(parent_index) < self.heap_container.size
    end
  
    def left_child(left_child_index)
      return self.heap_container[left_child_index]
    end
  
    def right_child(right_child_index)
      return self.heap_container[right_child_index]
    end
  
    def parent(child_index)
      return self.heap_container[self.get_parent_index[child_index]]
    end
  
    def empty?
      self.heap_container.length == 0 ? true : false
    end
  
    def to_string
      return self.heap_container.join()
    end
  
    def find(item)
      found_elements = []
      self.heap_container.each do |heap_item|
        if item == heap_item
          found_elements << heap_item
        end
      end
      return found_elements
    end
  
    def swap(one_index, two_index)
      temp = self.heap_container[one_index]
      self.heap_container[one_index] = self.heap_container[two_index]
      self.heap_container[two_index] = temp
    end
  
    def peek()
      return nil if self.heap_container === 0
      return self.heap_container[0]
    end
  
    def pair_is_in_correct_order(one_index, two_index)
      return true if self.heap_container[one_index] > self.heap_container[two_index]
      return false
    end
  
    #reorder the element when the element is added
    def heapify_up(custom_start_index = nil)
      current_index = custom_start_index.nil? ? (self.heap_container.length - 1) : custom_start_index 
      while(self.has_parent(current_index) && 
        self.pair_is_in_correct_order(current_index, self.get_parent_index(current_index)))
        
        self.swap(current_index, self.get_parent_index(current_index))
        current_index = self.get_parent_index(current_index)
      end
    end
  
    #reorder the heap when the element is removed
    def heapify_down(custom_start_index = 0)
      current_index = custom_start_index
      next_index = nil
      while(self.has_left_child(current_index))
        if(
          self.has_right_child(current_index) && 
          self.pair_is_in_correct_order(self.get_right_child_index(current_index), self.get_left_child_index(current_index)))
          
          next_index = self.get_right_child_index(current_index)
        else
          next_index = self.get_left_child_index(current_index)
        end
  
        break if(self.pair_is_in_correct_order(current_index, next_index))
        self.swap(current_index, next_index)
        current_index = next_index
      end
    end
  
    # remove the root element
    def poll()
      return nil if self.heap_container.length == 0
      return self.heap_container.pop() if self.heap_container.length == 1
  
      item = self.heap_container.pop()
      self.heap_container[0] = self.heap_container.pop()
      self.heapify_down()
      return item
    end
  end