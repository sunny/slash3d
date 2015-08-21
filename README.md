Ruby gem to access 3D Slash's API
=================================

Installation
------------

Add this line to your application's Gemfile:

    gem 'slash3d'

And then execute:

    $ bundle


Configuration
-------------

```rb
Slash3D.configure do |c|
  c.partner_code = 'foobar'
  c.api_key = 'd4he4fae262352e4…'
end
```


Usage
-----

```rb
iframe = Slash3D::Iframe.new(
  source: <url of stl or 3d slash id>,
  redirect_url: <your url>,

  # optional
  content_id: <unique id, no more than 255 chars>,
)

iframe.url #=> "https://www.3dslash.net/slash.php?…"
iframe.content_id #=> 42
```


Contributing
------------

1. Fork it ( https://github.com/sunny/slash3d/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
