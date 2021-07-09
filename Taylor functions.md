# Functions in Taylor
> ### add function
> This function takes two inputs and performs addition operation.
```
(add 10 20)

------

"result": 40
```

<br />

> ### sub function 
> This function takes two inputs and performs the subtraction operation.
```
(sub 10 5)

------

"result": 5
```

<br />

> ### mul function
> mul function takes two inputs and performs the multiplication operation.
```
(mul 100 100)

------

"result" : 10000
```
<br/>

> ### div function
> div function takes two inputs and performs the division operation.
```
(div 100 10)

------

"result" : 10
```
<br/>

> ### exp function
> The exp function takes two inputs base (a) and exponent(x) and performs exponential operation.
```
(exp 2 8)

------

"result" : 256
```
<br/>

> ## lt function
> lt (less than) function takes two numbers and compares them.If the first number is lesser than the second number it outputs "1" else outputs "0"
```
(lt 100 45)
(lt 45 100)

------

"result" : 0
"result" : 1
```

<br />

> ## gt function
> gt (greater than) function takes two inputs and compares them, if the first number is greater than the second number it output "1" else outputs "0"
```
(gt 256 1081)
(gt 1081 256)

------

"result' : 0
"result" : 1
```
<br />

> ## eq function
> eq (equal) function takes two inputs and compares them to check if both are same.It outputs "1" if both are equal else outputs "0"
```
(eq 17 256)
(eq 32 32)

------

"result" : 0
"result" : 1
```
<br/>

> ## iszero function
> iszero function checks if the number given is "0" or not.
```
(iszero 0)

------

"result" 1 
```
<br/>

> ## and function
> The and function (work at bit-level) takes two numbers as operands in decimal and does AND on every bit of two numbers. The result is 1 only if both bits are 1. The result of 
> and function is shown in decimal.
```
(and 0 0)
(and 1 1)
(and 3065 3256)

------

"result" : 0 
"result" : 1
"result" : 2232
```
<br />

> ## or function
> The or function (work at bit-level) takes two numbers as operands in decimal and does OR on every bit of two numbers. The result is 1 if any of the two bits is 1. The result
> of or function is shown in decimal.
```
(or 0 0)
(or 1 1)
(or 1 0)
(or 3065 3256)

------

"result" : 0
"result" : 1
"result" : 1
"result" : 4089
```

> ## xor function
> The xor function (work at bit-level) takes two numbers as operands in decimal and does XOR on every bit of two numbers.The result of XOR is 1 if the two bits are different.The > result of xor function is shown in decimal.

```
(xor 0 0)
(xor 1 0)
(xor 3065 3256)

------

"result" : 0
"result" : 1
"result" : 1857

```






