---
layout: post
title: Cohomology Intuitively 2
tags:
  - cohomology-intuitively
  - sage
---

Last time on Cohomology Intuitively, we focused on the cohomology of 
graphs. We had a <span class="defn">boundary map</span> from edges to
vertices, and used this in order to construct the cohomology group
$H^1$, which (intuitively) is made of the functions defined on edges,
modulo those that can be "integrated" to a function on the vertices.
It turns out the "obstruction" to integrating a function is the presence
of a cycle in your graph. That is, a "hole" in your space. This is the 
sense in which cohomology detects holes.

Today, we'll spend some more time playing with cohomology. In particular,
we'll 

Don't forget to plug the ddg lectures!

<div class="linked_auto">
<script type="text/x-sage">
@interact
def _(Simplices = input_box([['a','w','x','y'], ['b', 'c', 'd'], ['b','c','e'], ['b','d','e'], ['c','d','e']], width=50), auto_update=False):

    S = SimplicialComplex(Simplices)

    S1 = S.graph()
    pos = S1.layout(dim=3)

    p = S1.plot3d(pos3d=pos)

    # loop over the 2-cells
    try:
      for (v1,v2,v3) in S.cells()[2]:
        p += polygon3d([pos[v1],pos[v2],pos[v3]], opacity=0.3)
    except KeyError:
      pass

    # loop over the 3-cells
    try:
      for (v1,v2,v3,v4) in S.cells()[3]:
        p += polygon3d([pos[v1],pos[v2],pos[v3],pos[v4]])
    except KeyError:
      pass

    show(p)
    
</script>
</div>
