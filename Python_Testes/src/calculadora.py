def soma(x, y):
    """
    >>> soma(10,20)
    30

    >>> soma(10,5.5)
    15.5

    >>> soma(-10,20)
    10
    Traceback (most recent call last):
    ...
    AssertionError: x precisa ser int ou float
    """

    assert isinstance(x, (int, float)), "x precisa ser int ou float"
    assert isinstance(y, (int, float)), "y precisa ser int ou float"
    return x + y


def subtrai(x, y):
    """
    >>> subtrai(10,5)
    5

    >>> subtrai(20,5.5)
    14.5

    >>> subtrai(-10,20)
    -30
    Traceback (most recent call last):
    ...
    AssertionError: x precisa ser int ou float
    """

    assert isinstance(x, (int, float)), "x precisa ser int ou float"
    assert isinstance(y, (int, float)), "y precisa ser int ou float"
    return x - y


if __name__ == "__main__":
    import doctest

    doctest.testmod(verbose=True)
