import re

def get_good_numbers(input_string):
  pattern = r"\d{2,4}\\\d{2,5}"
  def replace(match):
    num1, num2 = match.split("\\")
    num1 = num1.zfill(4)
    num2 = num2.zfill(5)
    return num1 + "\\" + num2
  matches = re.findall(pattern, input_string)
  output = [replace(match) for match in matches]
  return output

s = r"Адрес 5467\456. Номер 405\549"
print(get_good_numbers(s))