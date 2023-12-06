import os
import sys

# Check if running in a testing environment
if 'GITHUB_ACTIONS' in os.environ:
    # In GitHub Actions, use environment variables or default values
    num1 = float(os.getenv('NUM1', '0'))
    num2 = float(os.getenv('NUM2', '0'))
else:
    # In a normal environment, use input()
    num1 = float(input("Enter first number: "))
    num2 = float(input("Enter second number: "))

sum = num1 + num2
print("The sum of", num1, "and", num2, "is", sum)

