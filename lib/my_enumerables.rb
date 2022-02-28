module Enumerable
  # --------------------------------------------------------------------------------
  # My implementation of Array.each method.
  # Calls the given block once for each element in self,
  # passing that element as a parameter. Returns the array itself.
  def my_each(&block)
    if block_given?
      for i in self
        block.call(i)
      end
    else
      return 'No block given'
    end
  end

  # --------------------------------------------------------------------------------
  # My implementation of Array.each_with_index method.
  # Calls block with two arguments, the item and its index, for each item in enum.
  # Given arguments are passed through to each().
  def my_each_with_index(&block)
    if block_given?
      index = -1
      for i in self
        block.call(i, index+=1)
      end
    else
      'No block given'
    end
  end

  # --------------------------------------------------------------------------------
  # My implementation of Array.select method.
  # Returns a new array containing all elements of array for
  # which the given block returns a true value.
  def my_select(&block)
    array = []
    if block_given?
      for i in self
        array << i if block.call(i)
      end
    else
      return 'No block given'
    end
    array
  end

  # --------------------------------------------------------------------------------
  # My implementation of Array.all? method.
  # Passes each element of the collection to the given block.
  # The method returns true if the block never returns false or nil.
  def my_all?(*arg, &block)
    false_count = 0
    if block_given?
      for i in self
        unless block.call(i)
          false_count += 1
        end
      end
      false_count > 0 ? false : true

    # When block isn't given and an argument is passed in, use argument as the parameter.
    elsif !block_given? && arg[0]
      for i in self
        unless arg[0] === i
          false_count += 1
        end
      end
      false_count > 0 ? false : true

    # When block isn't given, creates an implicit block of { |obj| obj }.
    elsif !block_given?
      for i in self
        if i == nil || i == false
          false_count += 1
        end
      end
      false_count > 0 ? false : true
    end
  end

  # --------------------------------------------------------------------------------
  # My implementation of Array.any? method.
  # Passes each element of the collection to the given block.
  # The method returns true if the block ever returns a value other than false or nil.
  def my_any?(*arg, &block)
    true_count = 0
    if block_given?
      for i in self
        if block.call(i)
          true_count += 1
        end
      end
      true_count > 0 ? true : false

    # When block isn't given and an argument is passed in, use argument as the parameter.
    elsif !block_given? && arg[0]
      for i in self
        if arg[0] === i
          true_count += 1
        end
      end
      true_count > 0 ? true : false

    # When block isn't given, creates an implicit block of { |obj| obj }.
    elsif !block_given?
      for i in self
        unless i == nil || i == false
          true_count += 1
        end
      end
      true_count > 0 ? true : false
    end
  end

  # --------------------------------------------------------------------------------
  # My implementation of Array.none? method.
  # Passes each element of the collection to the given block.
  # The method returns true if the block never returns true for all elements.
  def my_none?(*arg, &block)
    true_count = 0
    if block_given?
      for i in self
        if block.call(i)
          true_count += 1
        end
      end
      true_count == 0 ? true : false

    # When block isn't given and an argument is passed in, use argument as the parameter.
    elsif !block_given? && arg[0]
      for i in self
        if arg[0] === i
          true_count += 1
        end
      end
      true_count == 0 ? true : false

    # When block isn't given, creates an implicit block of { |obj| obj }.
    elsif !block_given?
      for i in self
        unless i == nil || i == false
          true_count += 1
        end
      end
      true_count == 0 ? true : false
    end
  end
  
  # --------------------------------------------------------------------------------
  # My implementation of Array.count
  # Returns the number of items in enum through enumeration.
  # If an argument is given, the number of items in enum that are equal to item are counted.
  # If a block is given, it counts the number of elements yielding a true value.
  def my_count(*arg, &block)
    true_count = 0
    if block_given?
      for i in self
        if block.call(i)
          true_count += 1
        end
      end
      true_count

    # If an argument is given, the number of items in enum that are equal to item are counted.
    elsif !block_given? && arg[0]
      for i in self
        if arg[0] === i
          true_count += 1
        end
      end
      true_count

    # When block isn't given, returns only the number of elements.
    elsif !block_given?
      self.length
    end
  end

  # --------------------------------------------------------------------------------
  # My implementation of Array.map method.
  # Invokes the given block once for each element of self.
  # Creates a new array containing the values returned by the block.
  def my_map(*arg, &block)
    new_array = []
    if block_given?
      for i in self
        new_array << block.call(i)
      end
      new_array
    else
      return 'No block given'
    end
  end

  # --------------------------------------------------------------------------------
  # My implementation of Array.inject/reduce method.
  def my_inject(*arg, &block)

  end
end

# --------------------------------------------------------------------------------
# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  #### Instead I used the core of my_each in evey method in my Enumerable Module.
  #### This made it longer but my understanable to me. That's why I didn't defined my_each here. 
end
