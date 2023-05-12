def add_spots(n, k, L):
  L.sort(reverse=True)
  result = []
  while k > 0:
    max = L[0]
    half = (max + 1) // 2
    result.append(half)
    result.append(half)
    L.pop(0)
    k -= 1
  result.extend(L)
  result.sort()
  return result

n = 5
k = 3
L = [100, 180, 50, 60, 150]
print(add_spots(n, k, L))