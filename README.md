# posh

Crystal wrapper for the **undocumented** Poshmark API. Work in progress.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  posh:
    github: watzon/posh
```

## Usage

```crystal
require "posh"

cli = Posh::Client.new
res = cli.login("username", "password")
pp res.user
```

## Development

This is still very much a work in progress. The Poshmark API is completely undocumented, so all endpoints have to be discovered using rounabout methods such as proxying a device through burpsuite and checking what calls are made where. Any help discovering routes would be of much help.

## Contributing

1. Fork it (<https://github.com/watzon/posh/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [watzon](https://github.com/watzon) your-name-here - creator, maintainer
