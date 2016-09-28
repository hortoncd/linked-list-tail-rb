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

describe LLNode do
  before :each do
    @ll = LLNode.new
  end

  it 'is a LLNode object' do
    expect(@ll).to be_kind_of(LLNode)
  end

  it 'has an empty key' do
    expect(@ll.key).to eq(nil)
  end

  it 'has an empty next "pointer"' do
    expect(@ll.next).to eq(nil)
  end

  it 'sets a key' do
    @ll.key = 1
    expect(@ll.key).to eq(1)
  end

  it 'sets a next "pointer"' do
    m = LLNode.new
    @ll.next = m
    expect(@ll.next).to be_kind_of(LLNode)
    expect(@ll.next).to eq(m)
  end
end
