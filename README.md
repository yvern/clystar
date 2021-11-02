# clystar

Basic Functional routines for Crystal, inspired by Clojure

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     clystar:
       github: yvern/clystar
   ```

2. Run `shards install`

## Usage

```crystal
require "clystar"
```

* `juxt` macro (vararg): turns `juxt T, f, g, h` into `->(x : T){ f(x), g(x), h(x) }` 
* `pipe` macro (vararg): turns `pipe T, f, g, h` into `->(x : T){ h(g(f(x))) }`
* `>>` operator (for `Procs`, binary forward composition): turns `->f(T) >> ->g(U)` into `->(x : T){ g(f(x)) }`

## Development

1. `shards install`
2. `crystal watch.cr`
3. add your new features!

## Contributing

1. Fork it (<https://github.com/yvern/clystar/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [yvern](https://github.com/yvern) - creator and maintainer
