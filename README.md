Ruby gem to access [3D Slash](https://www.3dslash.net/)'s API
=============================================================

Installation
------------

Add this line to your application's Gemfile:

```rb
gem "slash3d"
```

And then execute:

```sh
$ bundle
```


Configuration
-------------

```rb
Slash3D.configure do |c|
  c.partner_code = "foobar"
  c.api_key = "d4he4fae262352e4…"
end
```

You should get the partner code and API key by asking 3D Slash.


Usage
-----

### Get an iframe url

```rb
iframe = Slash3D::Iframe.new(
  source: <url of stl or 3d slash id>,
  redirect_url: <your url>,
  lang: 'en',
)

iframe.url #=> "https://www.3dslash.net/slash.php?…"
iframe.content_id #=> "4c5fd2b2aa423d430f22ba940f4e28f7060fc39b2e44…"
```

You can then use it in your page:

```html
<iframe frameborder="0" src="<%= iframe.url %>"></iframe>
```

### Handle the POST

Once the user has clicked "export", a `POST` request will be sent to the
`redirect_url` you have given.

To get URLs from these parameters, pass them to a `Response`:

```rb
response = Slash3D::Response.new(params)
```

You can get temporary URLs:

```rb
response.stl_url # => "https://www.3dslash.net/…"
response.thumbnail_url # => "https://www.3dslash.net/…"
response.slash3d_url # => "https://www.3dslash.net/…"
```

And the full URL to the creation:

```rb
response.permanent_url # => "https://www.3dslash.net/…"
```

For thumbnails you can specify size (defaults to 192x192):

```rb
response.thumbnail_url(width: 42, height: 42) # => "https://www.3dslash.net/…"
```

You can store this model's uid to use it as a `source` the next time
you make an `Iframe`.

```rb
response.uid # => "d430f22ba940f4e28f7060…"
```


Contributing
------------

1. Fork it ( https://github.com/sunny/slash3d/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Launch specs (`bundle exec rspec`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
