import numpy  as np

def min_votes(percentages):
  max_votes = 0

  for percentage in percentages:
    max_votes = max(max_votes, min_votes_for_percentage(percentage))

  if max_votes != 0:
    return max_votes
  else:
    return "Failed to produce a percentage. Consider reducing decimal places."

def min_votes_for_percentage(percentage):
  if percentage % 1 == 0:
      percentage = int(percentage)

  if percentage >= 100:
      return "Given percentage is over 100%. Consider using a lower percentage."

  decimal_places = number_of_decimal_places(percentage)

  for denominator in range(1, 1_000):
    for numerator in range(1, denominator):
      new_p = round(numerator / denominator * 100, decimal_places)
      if new_p == percentage:
        return denominator

def number_of_decimal_places(percentage):
  string_percentage = str(percentage)
  point_position = string_percentage.find('.')
  if point_position == -1:
    return 0
  else:
    return len(string_percentage) - point_position - 1

print("USE: Enter a percentage, or multiple percentages, (in the format of \"20 49.5 30.5\") to get the minimum number of votes in a poll that is required to produce those resulting percentages.")
print("For instance, a poll with the results [50%, 25% and 25%] must have at least 4 votes, since to produce 25%, you need at least 1 out of 4.")

try:
  input_percentages = [float(percentage) for percentage in input("Percentages: ").split()]
  print(min_votes(input_percentages))
except Exception:
  print("These may not look like percentages. Or input may be too long.")