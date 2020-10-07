# Algorithm----lecture III

## date:2020-9-24

## Asymptotic Notation

O:上界

$/Omega$ :lower bound

$/theta$ :equal bound

$/theta$(1) is a constant

o: strict upper bound o(g(n))=f(n) then limit f(n)/g(n)=0

$/omega$:strict lower bound $/omega$(g(n))=f(n) then limit f(n)/g(n)=&infin;

## modular Arithmetic

lg*(n)

## Recurrence

### Solving methods

* Substitution method:Guess a expression then test it
* recurrence tree
* master method T(n)=aT(n/b)+f(n)

### Substitution method

eg T(n)=4T(n/2)+n

* Assume T(1)=$/theta$(1)

* Guess T(n)=O($n^3$)

* assume T(k)<c*$k^3$ for every k<n

* prove T(n)<c*$n^3$

  T(n)=4*T(n/2)+n<4c*$k^3$+n<c*$n^3$

### Rucurrence methods

eg: T(n)=T(n/4)+T(n/2)+$n^2$

substitute the node in the tree according to the Tree

### The Master methods

eg T(n)=aT(n/b)+f(n)

* f(n)=O($n^(log_b(a)-e)$
* f(n)=$\Theta$($n(log_b(a)$$lg(k)$



