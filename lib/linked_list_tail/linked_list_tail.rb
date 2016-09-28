# Copyright 2016 Chris Horton
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module LinkedListTail
  # A class to implement a linked list with a tail pointer
  class LinkedList
    attr_accessor :head
    attr_accessor :tail
    attr_accessor :count

    def initialize
      @head = nil
      @tail = nil
      @count = 0
    end

    def inc
      @count += 1
    end

    def dec
      @count -= 1
    end

    def make_node(k)
      n = LLNode.new
      n.key = k
      n.next = nil
      return n
    end

    def empty?
      @head == nil ? true : false
    end

    def push_front(k)
      n = make_node(k)

      n.next = @head
      @tail = n if @head == nil
      @head = n
      inc
    end

    def push_back(k)
      n = make_node(k)

      @head = n if @tail == nil
      @tail.next = n unless @tail == nil
      @tail = n
      inc
    end

    def top_front
      return @head if @head == nil
      @head.key
    end

    def top_back
      return @tail if @tail == nil
      @tail.key
    end

    def pop_front
      return @head if @head == nil
      n = @head
      @head = n.next
      if @tail == n
        @tail = n.next
      end
      dec
      return n.key
    end

    def pop_back
      return @tail if @tail == nil
      n = @head
      while n do
        if n.next.next == nil
          k = n.next.key
          n.next = nil
          @tail = n
          dec
          return k
        end
        n = n.next
      end
    end

    def find(k)
      return @head if @head == nil
      n = @head
      while n do
        if n.key == k
          return true
        end
        n = n.next
      end
      return false
    end

    def erase(k)
      return @head if @head == nil
      n = @head
      prev = nil
      while n != nil do
        if n.key == k
          if @head == n
            @head = n.next
          end
          if @tail == n
            @tail = prev
          end
          if prev != nil
            prev.next = n.next
          end
          dec
          return k
        end
        prev = n
        n = n.next
      end
    end

    # TODO: implement if desired
    #def add_before(node, k)
    #end

    # TODO: implement if desired
    #def add_after(node, k)
    #end
  end
end
