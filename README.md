# fontawesome-svg-partials
Script to generate partials for the inline SVG icons of FontAwesome, with a Tailwind flavor.

## Why?
I like using inline SVGs for icons whereever necessary instead of relying on web fonts or fancy SVG with JS stuff.
But I don't like all of the noise using inline SVGs in my markup.  So this little script builds a set of partials that can
be used in a Rails app like so:

```erb
<%= render "icons/solid/building", classes: "w-6 h-6" %>
```
