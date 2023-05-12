def max_number_from_list(lst):
  lst.sort(reverse=True)
  result = "".join(lst)
  return result

lst = ["11","234","005","89"]
print(max_number_from_list(lst))