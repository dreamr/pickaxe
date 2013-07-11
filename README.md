# Pickaxe
* note: pickaxe requires ruby 1.9.3+

[![Build Status](https://travis-ci.org/dreamr/pickaxe.png)](https://travis-ci.org/dreamr/pickaxe)


Pickaxe is a wrapper for bundler because bundler doesn't set up Minitest. Gems without tests are sad!

Pickaxe on [Rubygems.org] (https://rubygems.org/gems/pickaxe)

## Installation

    $ gem install pickaxe

## Usage

    $ pickaxe gem_name

This will run bundle gem gem_name and then set that shit up with tests!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
