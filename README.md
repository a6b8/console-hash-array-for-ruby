<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/Headline.svg" height="55px" name="Console Hash Array" alt="# Console Hash Array">
</a>

Helper to print progress bar for hash array with long processes.
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/examples.svg" height="55px" name="example" alt="Example">
</a>
<br>
```ruby
require 'console_hash_array'

groups = ConsoleHashArray.example()
groups.keys.each.with_index do | key, rindex |
    p = ConsoleHashArray.console( nil, groups, rindex, nil, key, :left, {} )
    groups[ key ].each.with_index do | item, cindex |
        p = ConsoleHashArray.console( p, groups, rindex, cindex, key, :right, {} )
    end
    puts
end

# => 
# [0]  Nurwë                ..............................
# [1]  Legolas              ..............................
# [2]  Primrose Boffin      ..............................
# [3]  Aranuir              .......
# [4]  Ruby Gardner         ..............................
# [5]  Harding              ..............................
# [6]  Írimon               ..............................
# [7]  Torhir Ifant         ..............................
# [8]  Anairë               ..............................
# [9]  Golasgil             ..............................
# [10]  Mîm                 ..............................
# [11]  Tobold Hornblower   ..............
# [12]  Thrór               .....
# [13]  Gerda Boffin        ..............................

```

<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/table-of-contents.svg" height="55px" name="table-of-contents" alt="Table of Contents">
</a>
<br>

1. [Quickstart](#quickstart)<br>
2. [Parameters](#parameters)<br>
3. [Options](#options)<br>
4. [Contributing](#contributing)<br>
5. [Limitations](#limitations)<br>
6. [License](#license)<br>
7. [Code of Conduct](#code-of-conduct)<br>
8. [Support my Work](#support-my-work)<br>

<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/quickstart.svg" height="55px" name="quickstart" alt="Quickstart">
</a>

```ruby
require 'console_hash_array'

groups = ConsoleHashArray.example()
groups.keys.each.with_index do | key, rindex |
    p = ConsoleHashArray.console( nil, groups, rindex, nil, key, :left, {} )
    groups[ key ].each.with_index do | item, cindex |
        p = ConsoleHashArray.console( p, groups, rindex, cindex, key, :right, {} )
    end
    puts
end
```
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/local-path-builder-for-ruby/readme/headlines/setup.svg" height="55px" name="setup" alt="Setup">
</a>

Add this line to your application's Gemfile:

```ruby
gem console_hash_array
```

And then execute:
```ruby
bundle install console_hash_array
```

Or install it yourself as:
```ruby
gem install console_hash_array
```

On Rubygems: 
- Gem: https://rubygems.org/gems/console_hash_array
- Profile: https://rubygems.org/profiles/a6b8

<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/methods.svg" height="55px" name="methods" alt="Methods">
</a>

### .example()
```ruby
require 'console_hash_array'

groups = ConsoleHashArray.example()
```
**Return**<br>
Hash    


### .console()
```ruby
require 'console_hash_array'

p = ConsoleHashArray.console( nil, groups, rindex, cindex, key, :left, {} )
```


**Input**
| | **Type** | **Required** | **Description** |
|------:|:------|:------|:------|
| **p** | ```Hash``` | :left = nil, :right = Yes  | Parameters for console |
| **groups** | ```Hash of Arrays``` | Yes | Full Groups Hash |
| **rindex** | ```Int``` | Yes | Set row index for calculation and output options. |
| **cindex** | ```Int``` | :left = nil, :right = Yes | Set column index for calculation and output options. |
| **key** | ```String``` or ```Symbol``` | Yes | Set current key from groups hash. |
| **mode** | ```Symbol``` | Yes | Use ```:left``` for initialization row, ```:right``` will update progres line |
| **options** | ```Hash``` | No | Change default behaviour. See options for more informations. |

**Return**<br>
Hash (p)
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/options.svg" height="55px" name="options" alt="Options">
</a>
| Nr | Name | Key | Default | Type | Description |
| :-- | :-- | :-- | :-- | :-- | :-- |
| 1 | Boxes Total | `:right__boxes_total` | `30`| Int | Set length of progres bar |
| 2 | Spaces | `:style__spaces` | `" "`| String | Set Character of space |
| 3 | Steps | `:style__steps` | `"."`| String | Set Character of steps |
| 4 | Print Left | `:print__left` | `"[{{rindex}}]  {{key}} {{left__spaces}}  "`| String | Set Structure for `:left` |

<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/contributing.svg" height="55px" name="contributing" alt="Contributing">
</a>

Bug reports and pull requests are welcome on GitHub at https://github.com/a6b8/console-hash-array-for-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/a6b8/console-hash-array-for-ruby/blob/master/CODE_OF_CONDUCT.md).
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/limitations.svg" height="55px" name="limitations" alt="Limitations">
</a>
- Build for development usage
- No input validation
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/license.svg" height="55px" name="license" alt="License">
</a>

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/code-of-conduct.svg" height="55px" name="code-of-conduct" alt="Code of Conduct">
</a>
    
Everyone interacting in the console-hash-array-for-ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/a6b8/console-hash-array-for-ruby/blob/master/CODE_OF_CONDUCT.md).
<br>
<br>
<br>
<a href="#table-of-contents">
<img href="#table-of-contents" src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/console-hash-array-for-ruby/readme/headlines/support-my-work.svg" height="55px" name="support-my-work" alt="Support my Work">
</a>
    
Donate by [https://www.paypal.com](https://www.paypal.com/donate?hosted_button_id=XKYLQ9FBGC4RG)