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

require_relative 'spec_helper.rb'
require_relative '../lib/linked_list_tail'

include LinkedListTail

describe LinkedListTail do
  before :each do
    @ll = LinkedList.new
  end

  it 'is a LinkedList object' do
    expect(@ll).to be_kind_of(LinkedList)
  end

  it 'has a count of 0' do
    expect(@ll.count).to eq(0)
  end

  it 'increments the counter' do
    @ll.inc
    expect(@ll.count).to eq(1)
  end

  it 'decrements the counter' do
    @ll.count = 5
    @ll.dec
    expect(@ll.count).to eq(4)
  end

  it 'has an empty head pointer' do
    expect(@ll.head).to eq(nil)
  end

  it 'has an empty tail pointer' do
    expect(@ll.tail).to eq(nil)
  end

  it 'returns empty if list is empty' do
    expect(@ll.empty?).to eq(true)
  end

  it 'creates a node with a key' do
    n = @ll.make_node(1)
    expect(n).to be_kind_of(LLNode)
    expect(n.key).to eq(1)
    expect(n.next).to eq(nil)
  end

  it 'returns the nil top_front is called on an empty list' do
    expect(@ll.top_front).to eq(nil)
  end

  it 'returns the nil top_back is called on an empty list' do
    expect(@ll.top_back).to eq(nil)
  end

  it 'returns the first key when top_front is called' do
    n = @ll.make_node(1)
    @ll.head = n
    expect(@ll.top_front).to eq(1)
  end

  it 'pushes to front and returns the first key as "head" when added to an empty list' do
    @ll.push_front(1)
    expect(@ll.top_front).to eq(1)
  end

  it 'pushes to front and returns the first key as "tail" when added to an empty list' do
    @ll.push_front(1)
    expect(@ll.top_front).to eq(1)
  end

  it 'pushes multiple keys to front and returns the right "head" and "tail" keys' do
    @ll.push_front(1)
    @ll.push_front(2)
    expect(@ll.top_front).to eq(2)
    expect(@ll.top_back).to eq(1)
  end

  it 'pushes to front and correctly increments the count' do
    @ll.push_front(1)
    expect(@ll.count).to eq(1)
    @ll.push_front(3)
    expect(@ll.count).to eq(2)
  end

  it 'pushes to back and correctly increments the count' do
    @ll.push_back(1)
    expect(@ll.count).to eq(1)
    @ll.push_back(3)
    expect(@ll.count).to eq(2)
  end

  it 'pushes to back and returns the first key as "head" when added to an empty list' do
    @ll.push_front(1)
    expect(@ll.top_front).to eq(1)
  end

  it 'pushes to back and returns the first key as "tail" when added to an empty list' do
    @ll.push_back(1)
    expect(@ll.top_back).to eq(1)
  end

  it 'pushes multiple keys to back and returns the right "head" and "tail" keys' do
    @ll.push_back(2)
    @ll.push_back(1)
    expect(@ll.top_back).to eq(1)
    expect(@ll.top_front).to eq(2)
  end

  it 'pops front item and returns the right key' do
    @ll.push_front(3)
    @ll.push_front(2)
    @ll.push_front(1)
    k = @ll.pop_front
    expect(k).to eq(1)
  end

  it 'pops back item and returns ths right key' do
    @ll.push_front(3)
    @ll.push_front(2)
    @ll.push_front(1)
    k = @ll.pop_back
    expect(k).to eq(3)
  end

  it 'pops front item and shows the right "head" key' do
    @ll.push_front(3)
    @ll.push_front(2)
    @ll.push_front(1)
    k = @ll.pop_front
    expect(k).to eq(1)
    expect(@ll.top_front).to eq(2)
  end

  it 'pops back item and shows the right "back" key' do
    @ll.push_front(3)
    @ll.push_front(2)
    @ll.push_front(1)
    k = @ll.pop_back
    expect(k).to eq(3)
    expect(@ll.top_back).to eq(2)
  end

  it 'searches the list for a key and returns true if found' do
    @ll.push_front(1)
    @ll.push_front(2)
    expect(@ll.find(2)).to eq(true)
  end

  it 'searches the list for a key and returns false not found' do
    @ll.push_front(1)
    @ll.push_front(2)
    expect(@ll.find(3)).to eq(false)
  end

  it 'correctly erases the only existing node' do
    @ll.push_front(17)
    expect(@ll.top_front).to eq(17)
    expect(@ll.top_back).to eq(17)
    @ll.erase(17)
    expect(@ll.top_front).to eq(nil)
    expect(@ll.top_back).to eq(nil)
    expect(@ll.empty?).to eq(true)
  end

  it 'correctly erases the node with key "k"' do
    expect(@ll.erase(1)).to eq(nil)
    @ll.push_front(3)
    @ll.push_front(2)
    @ll.push_front(1)
    @ll.erase(1)
    expect(@ll.top_front).to eq(2)
    expect(@ll.top_back).to eq(3)
    @ll.erase(2)
    expect(@ll.top_front).to eq(3)
    expect(@ll.top_back).to eq(3)
  end

  it 'correctly erases the node with key "k" with more nodes in the list' do
    expect(@ll.erase(1)).to eq(nil)
    (1..10).each do |k|
      @ll.push_back(k)
    end
    @ll.push_back(15)
    @ll.push_front(20)
    expect(@ll.top_front).to eq(20)
    expect(@ll.top_back).to eq(15)
    @ll.erase(9)
    @ll.erase(10)
    @ll.erase(15)
    expect(@ll.top_front).to eq(20)
    expect(@ll.top_back).to eq(8)
  end

  it "correctly erases the node with key 'k' with more shuffled nodes push_front'ed in the list" do
    expect(@ll.erase(1)).to eq(nil)

    @ll.push_front(3)
    @ll.push_front(2)
    @ll.push_front(6)
    @ll.push_front(5)
    @ll.push_front(8)
    @ll.push_front(1)

    expect(@ll.top_front).to eq(1)
    expect(@ll.top_back).to eq(3)

    @ll.erase(3)
    expect(@ll.top_back).to eq(2)

    @ll.erase(1)
    expect(@ll.top_front).to eq(8)

    @ll.erase(5)
    expect(@ll.top_front).to eq(8)
    @ll.erase(8)
    expect(@ll.top_front).to eq(6)
  end

  it "correctly erases the node with key 'k' with more shuffled nodes push_back'ed in the list" do
    expect(@ll.erase(1)).to eq(nil)
    @ll.push_back(3)
    @ll.push_back(2)
    @ll.push_back(6)
    @ll.push_back(5)
    @ll.push_back(8)
    @ll.push_back(1)

    expect(@ll.top_front).to eq(3)
    expect(@ll.top_back).to eq(1)

    @ll.erase(3)
    expect(@ll.top_front).to eq(2)

    @ll.erase(1)
    expect(@ll.top_back).to eq(8)

    @ll.erase(5)
    expect(@ll.top_back).to eq(8)
    @ll.erase(8)
    expect(@ll.top_back).to eq(6)
  end
end
