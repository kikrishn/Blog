# Built-in Features

* To access custom definition styling, use the format `<span class="defn">content</span>`
* Call box styling with `<div class="boxed">content</div>`
* All hard returns in markdown files automatically generate paragraph breaks with space between them.
* By default, horizontal lines for section breaks are light grey with built in margin.  
* Mobile compatible

# Editing How-To

I made style customization easy with variables. Go to sass -> variables to adjust the color palette, font choices, content width, and mobile breakpoints.

If you'd like to make your own variable, the syntax is `$variable-name: variable-value;`. Whenever you want to call that value, the syntax is `css-selector: $variable-name;`

All sizing, aside from base font size and fixed widths, is sized in rems. These are relative units that scale using the base font size as their constant (1rem = base font size). Sticking to rems when adjusting your sizing ensures your site is more responsive and proportionally constant across various screen and window sizes.

# Individualized Layout Styling

The "base" stylesheet applies to the entire site. The "nav" stylesheet applies to the nav bar across the site.

All {{content}} is wrapped in `<main>` tags so it accesses base main content styling. Layouts with special formatting have a class added to their main tag (note: the post layout is wrapped in a highest level div instead, because it's derived from the default layout). Those class names correspond to a stylesheet of the same name in the sass directory.

The formatting in these layout stylesheets is layout-specific.

# Pages
* landing
* math blog
* teaching
* CV
* quotes

---

New notes:

I actually think it makes sense to merge the "quotes" page into the "about" page, 
so if that stylesheet doesn't exist yet, that's fine. 

As for links, I don't think we need any. The only thing I considered linking
was my math stackexchange account, but that's hallasurvivor, and I want to 
make people work _slightly_ harder to figure out that connection.
