<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/custom/console-hash-array.svg" height="45px" name="# Console Hash Array for Ruby" alt="Console Hash Array for Ruby">
</a>

Console print progress bar for hash arrays.
<br>
<br>

<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/examples.svg" height="45px" name="examples" alt="Examples">
</a>
<br>

**Default output without options**
```ruby
require 'console_hash_array'

groups = ConsoleHashArray.example()
groups.keys.each.with_index do | key, rindex |
    ConsoleHashArray.console( groups, rindex, nil, key, :left )
    groups[ key ].each.with_index do | item, cindex |
        ConsoleHashArray.console( groups, rindex, cindex, key, :right )
    end
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
<br>


**Custom output with options**
```ruby
require 'console_hash_array'

groups = ConsoleHashArray.example()

options = { 
    right__boxes_total: 10,
    style__spaces: '.',
    style__steps: '#',
    print__left: "{{rindex}}.{{key}}{{left__spaces}}.."
} 

groups.keys.each.with_index do | key, rindex |
    ConsoleHashArray.console( groups, rindex, nil, key, :left )
    groups[ key ].each.with_index do | item, cindex |
        ConsoleHashArray.console( groups, rindex, cindex, key, :right, options )
    end
end

# => 
# 0. Nurwë                 ####################
# 1. Legolas               ##
# 2. Primrose Boffin       #####
# 3. Aranuir               ###########
# 4. Ruby Gardner          ########
# 5. Harding               ##########
# 6. Írimon                ####################
# 7. Torhir Ifant          ####################
# 8. Anairë                ####
# 9. Golasgil              ####
# 10. Mîm                  
# 11. Tobold Hornblower    #####
# 12. Thrór                ####################
# 13. Gerda Boffin         #####

```
<br>

<a href="#headline">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/table-of-contents.svg" height="45px" name="table-of-contents" alt="Table of Contents">
</a>
<br>

1. [Examples](#examples)<br>
1. [Quickstart](#quickstart)<br>
2. [Setup](#setup)
3. [Methods](#methods)<br>
4. [Options](#options)<br>
5. [Contributing](#contributing)<br>
6. [Limitations](#limitations)<br>
7. [License](#license)<br>
8. [Code of Conduct](#code-of-conduct)<br>
9. [Support my Work](#support-my-work)<br>

<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/quickstart.svg" height="45px" name="quickstart" alt="Quickstart">
</a>

```ruby
require 'console_hash_array'

groups = ConsoleHashArray.example()
groups.keys.each.with_index do | key, rindex |
    ConsoleHashArray.console( groups, rindex, nil, key, :left )
    groups[ key ].each.with_index do | item, cindex |
        ConsoleHashArray.console( groups, rindex, cindex, key, :right )
    end
end
```

<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/setup.svg" height="45px" name="setup" alt="Setup">
</a>

Add this line to your application's Gemfile:

```bash
gem console_hash_array
```

And then execute:
```bash
bundle install console_hash_array
```

Or install it yourself as:
```bash
gem install console_hash_array
```

On Rubygems: 
- Gem: https://rubygems.org/gems/console_hash_array
- Profile: https://rubygems.org/profiles/a6b8


<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/methods.svg" height="45px" name="methods" alt="Methods">
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

ConsoleHashArray.console( groups, rindex, cindex, key, :left )
```


**Input**
| | **Type** | **Required** | **Description** |
|------:|:------|:------|:------|
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

<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/options.svg" height="45px" name="options" alt="Options">
</a>

| Nr | Name | Key | Default | Type | Description |
| :-- | :-- | :-- | :-- | :-- | :-- |
| 1 | Boxes Total | `:right__boxes_total` | `30`| Int | Set length of progres bar |
| 2 | Spaces | `:style__spaces` | `" "`| String | Set Character of space |
| 3 | Steps | `:style__steps` | `"."`| String | Set Character of steps |
| 4 | Print Left | `:print__left` | `"[{{rindex}}]  {{key}} {{left__spaces}}  "`| String | Set Structure for `:left` |

<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/contributing.svg" height="45px" name="contributing" alt="Contributing">
</a>

Bug reports and pull requests are welcome on GitHub at https://github.com/a6b8/console-hash-array-for-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/a6b8/console-hash-array-for-ruby/blob/master/CODE_OF_CONDUCT.md).

<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/limitations.svg" height="45px" name="limitations" alt="Limitations">
</a>

- Build for development usage
- No input validation

<br>

<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/credits.svg" height="45px" name="credits" alt="Credits">
</a>


<br>

<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/license.svg" height="45px" name="license" alt="License">
</a>

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/code-of-conduct.svg" height="45px" name="code-of-conduct" alt="Code of Conduct">
</a>
    
Everyone interacting in the console-hash-array-for-ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/a6b8/console-hash-array-for-ruby/blob/master/CODE_OF_CONDUCT.md).

<br>

<a href="#table-of-contents">
<img href="#table-of-contents" src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/star-us.svg" height="45px" name="star-us" alt="Star Us">
</a>

Please ⭐️ star this Project, every ⭐️ star makes us very happy!