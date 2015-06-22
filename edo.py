def last(liste):
    return liste[len(liste) - 1] if liste else None


def Euler(f, a, b, h0, n):
    """
    f : [a, b] x R -> R
        First argument is the time variable, and second is the function to
        calculate
    h0 : the initial condition
    n : points to calculate

    Return an array of points calculated with Euler methods. These points will
    approximate the function corresponding to the differential equation.
    """
    step = (b - a) / n
    output = [h0]
    i = 1
    while i < n:
        t_i = a + i * step
        h_t_i = last(output)
        output.append(h_t_i + step * f(t_i, h_t_i))
        i = i + 1
    return output
