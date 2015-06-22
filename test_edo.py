import edo
import matplotlib.pyplot as plot
import math

a = 0.
b = 1.
N = 1000
M = 1000
k = 2

def interval(a, b, n):
    i = 0
    t = []
    step = (b - a) / n
    while i < n:
        t.append(a + i * step)
        i = i + 1
    return t

def f(t, u):
    return (k*u)

def sol_f(t):
    return (math.exp(k*t))

def plot_result(xn):
    plot.grid(True)

    list_x = interval(a, b, N)
    plot.plot(list_x, xn, label = "Euler " + str(N) + " points")

    list_x = interval(a, b, M)
    list_y = map(sol_f, list_x)
    plot.plot(list_x, list_y, label = "Real solution")

    plot.legend()
    plot.show()


plot_result(edo.Euler(f, a, b, 1, N))
