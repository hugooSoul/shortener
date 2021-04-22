# QUIZ

## Exercise 1

```ruby
def product(arr_or_range)
  #arr_or_range.inject(:*)
  result = 1
  arr_or_range.each do |number|
    result *= number
  end

  result
end
```

## Exercise 2

```ruby
def anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end
```

## Exercise 3

```ruby
def compare(str1, str2)
  str1.downcase === str2.downcase
end
```
