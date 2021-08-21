require '../lib/console_hash_array'


tests = [
  { test:'' },
  { 
    right__boxes_total: 20,
    style__steps: '#',
    print__left: "{{rindex}}. {{key}} {{left__spaces}}   "
  },
  { 
    right__boxes_total: 10,
    style__spaces: '.',
    style__steps: '#',
    print__left: "{{rindex}}.{{key}}{{left__spaces}}.."
  },
  {
    er: 'deded',
    ddde: 'dedede',
    right__boxes_total: 50,
  }
]

tests.each do | test |
  groups = ConsoleHashArray.example()

  groups.keys.each.with_index do | key, rindex |
      ConsoleHashArray.console( groups, rindex, nil, key, :left, test )
      groups[ key ].each.with_index do | item, cindex |
          ConsoleHashArray.console( groups, rindex, cindex, key, :right )
      end
  end

  puts
  puts
end

