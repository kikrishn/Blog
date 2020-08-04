# Built-in Features

* To access custom definition styling, use the format <span class="defn">content</span>
* Call box styling with <div class="boxed">content</div>
* All hard returns in markdown files automatically generate paragraph breaks with space between them.
* By default, horizontal lines for section breaks are light grey with built in margin.  

# Editing How-To

I made style customization easy with variables. Go to sass -> variables to adjust the color palette, font choices, content width, and mobile breakpoints.

If you'd like to make your own variable, simply copy the syntax in the variable stylesheet and add your value. Whenever you want to call that value, the syntax is $variable-name;

# Individualized Layout Styling

The "base" stylesheet applies to the entire site. The "nav" stylesheet applies to the nav bar across the site.

All {{content}} is wrapped in <main> tags so it accesses base main content styling. Layouts with special formatting have a class added to their main tag. Those class names correspond to a stylesheet of the same name in the sass directory.

The formatting in these layout stylesheets is layout-specific.

# Pages
* landing
* math blog
* teaching
* CV
* quotes

I really like the clean white background with pale accent colors aesthetic.
Lots of whitespace, etc.

[sheaves.github.io](https://sheaves.github.io) is a very simple blog that looks good,
and you can actually see the jekyll code
[here](https://github.com/sheaves/sheaves.github.io).

Here's another one that I like, but this website doesn't really exist,
so I can't directly link it to you :(

![genimi](https://scontent-lax3-1.xx.fbcdn.net/v/t1.15752-9/116453290_710388332858870_8931857397901942835_n.png?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=Nq_p-L4G3BkAX8fofYI&_nc_ht=scontent-lax3-1.xx&oh=809c439ae500c77abf727c0516494aba&oe=5F4B33A5)

You probably remember [maayanalbert.com](https://maayanalbert.com), but I also think that design is
extremely cool.

---

Thanks again <3 lmk if you want more references

---

*Edit*

Could you also add a .boxed class that centers whatever's in it
and puts a box around it? I made a rudimentary one already, but it's _bad_

ooooh, also a "defn" thing for text,
(ideally coloring the text some shade of blue, and maybe bolding it a little?)
that I can use for definitions? Thank you <3
