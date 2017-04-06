require 'byebug'
def first_anagram?(string, anagram)
  anagrams = get_all_anagrams(string)
  anagrams.include?(anagram)
end

def get_all_anagrams(string)
  return [string] if string.length == 1
  char = string.slice(-1)
  anagrams = get_all_anagrams(string[0...-1])
  answer = []
  anagrams.each do |anagram|
    (string.length + 1).times do |i|
      ending = anagram[i...anagram.length]
      answer << anagram[0...i] + char + (ending.nil? ? "" : ending)
    end
  end
  answer
end

def delete_at(string, i)
  string[0...i] + string[i + 1..-1]
end

def second_anagram?(string, anagram)
  until anagram.empty?
    current_char = string[0]
    string = string[1..-1]
    i = anagram.index(current_char)
    break if i.nil?
    anagram = delete_at(anagram, i)
  end

  string.empty? && anagram.empty?
end

def third_anagram?(string, anagram)
  sorted_string = string.chars.sort.join("")
  sorted_anagram = anagram.chars.sort.join("")
  sorted_anagram == sorted_string
end

def fourth_anagram?(string, anagram)
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

#p get_all_anagrams("abc")
