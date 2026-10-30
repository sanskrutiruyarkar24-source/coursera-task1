# Simple Interest Calculator

A simple interest calculator computes the interest earned or owed on a principal amount over a period of time at a fixed rate.

## Formula

```
SI = (P × R × T) / 100
```

- **P** – Principal (initial amount)
- **R** – Annual rate of interest (%)
- **T** – Time (in years)

Total amount: `A = P + SI`

## Example

P = 10,000, R = 5%, T = 3 years

SI = (10000 × 5 × 3) / 100 = **1,500**
Total amount = **11,500**

## Usage (Python)

```python
p = float(input("Principal: "))
r = float(input("Rate (%): "))
t = float(input("Time (years): "))
si = p * r * t / 100
print(f"Simple Interest = {si}, Total = {p + si}")
```
