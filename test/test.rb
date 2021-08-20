require '../lib/console_hash_array'


groups = ConsoleHashArray.example()
groups.keys.each.with_index do | key, rindex |
    p = ConsoleHashArray.console( nil, groups, rindex, nil, key, :left, { test:'' } )
    groups[ key ].each.with_index do | item, cindex |
        p = ConsoleHashArray.console( p, groups, rindex, cindex, key, :right )
    end
  puts
end