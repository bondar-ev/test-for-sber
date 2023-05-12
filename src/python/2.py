def add_spots(n, k, L):
  min_val = min(L)
  max_val = max(L)
  left = min_val
  right = max_val
  while left < right:
    mid = (left + right) // 2
    count = 0
    for l in L:
      count += (l - 1) // mid
    if count <= k:
      right = mid
    else:
      left = mid + 1
  result = []
  for l in L:
    count = (l - 1) // left
    if count > 0:
      new_l = (l + count) // (count + 1)
      for _ in range(count + 1):
        result.append(new_l)
    else:
      result.append(l)
  return result

n = 5
k = 3
L = [100, 180, 50, 60, 150]
print(add_spots(n, k, L))