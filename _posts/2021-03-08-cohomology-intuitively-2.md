---
layout: post
title: Cohomology Intuitively 2
tags:
  - cohomology
  - geometry
  - algebra
  - sage
---

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
