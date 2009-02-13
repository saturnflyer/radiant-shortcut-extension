You can set an page in your site to be a shortcut. By doing so, your 
page that is created at `/about/people/jim` and marked as a shortcut
may be found at `/jim`

In order for this to function properly, you must set the page type
of the home page as `Shortcut Finder` and create a child page as
a `Shortcut Display`.

No content on your `Shortcut Display` page will be shown, but it will
be used to make your deeply nested page (`/about/people/jim`) act like
it is a child of the home page.

## Tags

With Shortcut, you also have some tags available to make your content
integrate well with Radiant. You may use `shortcut_link` and `shortcut_url`.

Those two tags work exactly like their standard counterparts `link` and
`url` but they will (if the page on which they are used is a shortcut)
use a URL that is directly following the website address.

On a shortcut page, `<r:shortcut_url />` will yield `/the-slug/`
  
On a non-shortcut page `<r:shortcut_url />` will yield
`/the-full/url-for/the-slug/`