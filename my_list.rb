require_relative 'my_enumerable'
class Mylist
  include MyEnumerable
  def initialize(*list)
    @list = list
  end

  def each
    return to_enum(:each) unless block_given?

    counter = 0
    while counter < @list.length
      yield(@list[counter])
      counter += 1
    end
    @list
  end
end

# Create our list
list = Mylist.new(1, 2, 3, 4)
#  <MyList: @list=[1, 2, 3, 4]>>

# all? method
list.all? { |e| e < 5 } # true

list.all? { |e| e > 5 } # false
# any? method
list.any? { |e| e == 2 } # true

list.any? { |e| e == 5 } # false
# filter? method
list.filter?(&:even?) # [2, 4]
