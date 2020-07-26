"""
Pick some events on n (labelled) balls and find all dependency graphs for them

We use the uniform distribution, for simplicity
"""

# Number of balls
n = 5

def pickEvents(m):
    """
    Pick m events from the 2^n possible events
    

    @param m the number of events to take
    @return: a list of events

    """
    ret = []
    l = [i for i in range(n)]
    for i in range(m):
        es = sample(l,randint(0,n))
        ret += [es]
    return ret

def isMutuallyIndependentOf(e, es):
    """
    True iff e is mutually independent of es
    

    @param e an event
    @param es a list of events
    @return: true/false

    """
    if len(es) == 0:
        return True
    else:
        esSet = [set(x) for x in es]

        old = len(e) / n
        new = len(set.intersection(set(e),*esSet)) / len(set.intersection(*esSet))
        return old == new
