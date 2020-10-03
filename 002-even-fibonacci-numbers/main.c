#include <stdio.h>
#include <ctype.h>
#include <immintrin.h>
#include <math.h>
#pragma STDC FP_CONTRACT ON  /* https://stackoverflow.com/a/15933677/3601493 */

const double sqrt5 = 2.23606797749979;  /* ⎕PP←17⋄5*.5 */
const double isqrt5 = 1.0/sqrt5;
const double Phi = (1.0+sqrt5)/2.0;
const double phi = (1.0-sqrt5)/2.0;
const double Theta = Phi*Phi*Phi;
const double theta = phi*phi*phi;
const double Omega = 1.0/(Theta-1);
const double omega = -1.0/(theta-1);
const double b = -(Omega+omega);

double f_sum_even(__uint64_t n);
double f(__uint64_t n);
double log_f(__uint64_t n);
double log_f_exact(__uint64_t n);
__uint64_t finv(double x);
__uint64_t logfinv(double x);
double log_f_sum_even(__uint64_t n);
double log_f_sum_even_exact(__uint64_t n);

/* nth fibonacci fn, with f1:=1, f2:=1, ... */
double f(__uint64_t n) {
    return round(isqrt5*(pow(Phi, n) - pow(phi, n)));
}

double log_f(__uint64_t n) {
    return n*log(Phi)+log(isqrt5);
}

double log_f_exact(__uint64_t n) {
    if (n < 150)
        return log(f(n));
    return log_f(n);
}

/* inverse fibonacci, returning n : fn <= x, f(n+1) >x */
__uint64_t finv(double x) {
    __uint64_t n = (__uint64_t) floor(log(sqrt5*x)/log(Phi));
    for (; f(n) <= x; n++);
    for (; f(n) > x; n--);
    return n;
}

__uint64_t logfinv(double x) {
    __uint64_t n = (__uint64_t) floor((x+log(sqrt5))/log(Phi));
    for (; log_f_exact(n) <= x; n++);
    for (; log_f_exact(n) > x; n--);
    return n;
}

double f_sum_even(__uint64_t n) {
    double res;

    n = n/3+1;  // theta carries the power of 3; this adds only evens, and then we want the power + 1
    res = pow(theta, n);              // sum from smallest to largest terms
    res = res*omega+b;                // this should get FMAed
    res = (pow(Theta, n))*Omega+res;  // this should get FMAed
    res *= isqrt5;
    return round(res);
}

double log_f_sum_even(__uint64_t n) {
    double d = log(Theta), c = d+log(isqrt5*Omega);
    return (n/3)*d+c;
}

double log_f_sum_even_exact(__uint64_t n){
    if (n > 150)
        return log_f_sum_even(n);
    return log(f_sum_even(n));
}

int main() {
    int x, j = 80, xs[] = {1, 2, 3, 5, 6, 7, 8, 9, 55, 56, 832039, 832040, 832041};
    double (*l[])(__uint64_t) = {f_sum_even, log_f_sum_even_exact, f, log_f_exact};
    char *d[] = {"Log sum of even ", ""};

    for (int i=0; i<2; i++) {
        printf("%sfibonacci terms through n=%d for f1:=1, f2:=1, ...:\n", d[i], j);
        printf("%0.17g\n", log(l[2 * i]((__uint64_t) j)));
        printf("Same, but directly calculated:\n");
        printf("%0.17g\n", l[2 * i + 1]((__uint64_t) j));
    }
    for (int i=0; i<13; i++)
        printf("%lldth fibonacci greatest less than %d\n", finv((double) xs[i]), xs[i]);
    printf("Please provide a number to get the log sum of even fibonacci terms less than it:\n");
    scanf("%d", &x);
    printf("Result: %0.17g\n", log_f_sum_even_exact(finv((double) x)));
    printf("Log result: %0.17g\n", log_f_sum_even_exact(logfinv(log(x))));
    printf("finv(x) == logfinv(log(x)): %d", finv((double) x) == logfinv(log(x)));
    return 0;
}