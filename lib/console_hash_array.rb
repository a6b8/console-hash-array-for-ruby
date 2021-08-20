# frozen_string_literal: true

require_relative "console_hash_array/version"

module ConsoleHashArray
  class Error < StandardError; end

  def self.console( p, arr, rindex, cindex, key, mode, options={} )
    def self.options_insert( p, arr, rindex, cindex, key, mode, options )
      if !options.keys.include?( :print__left )
        options[:print__left] = p[:print][:left] 
      end


      errors = []
      options.keys.each do | key |
        allow = [ 
          :right__boxes_total, 
          :style__spaces, 
          :style__steps 
        ]
        
        denied = [
          :print__left
        ]
        
        if allow.include?( key )
          kk = key.to_s.split( '__' ).map { | a | a.to_sym }
          p[ kk[ 0 ] ][ kk[ 1 ] ] = options[ key ]
        else
          if !denied.include?( key )
            error = "  \":#{key.to_s}\" - Key not found."
            errors.push( error )
          end
        end
      end
      return [ p, errors ]
    end
  
  
    def self. options_print_left( p, arr, rindex, cindex, key, mode, options )
      errors = []
        
      if options.keys.include?( :print__left )
        vars = options[:print__left]
            .scan( /\{{[a-z,_,:]+\}}/ )
            .map { | a | a.gsub( /[{:}]/, '' ) }

        str = options[:print__left]
        vars.each do | var |
          var = "{{#{var}}}"
          if !var.index( '__' ).nil?
            keys = var.split( '__' )
              .map { | a | a.gsub( /[{}]/, '' ) }
              .map { | a | a.to_sym }

            str = str.gsub( var, p[ keys[ 0 ] ][ keys[ 1 ] ] )
          else
            case var
              when '{{rindex}}'
                  m = ( arr.keys.length-1 ).to_s.length
                  mm =  m - rindex.to_s.length
                  p[:left][:spaces] << mm.times.map { | a | p[:style][:spaces] }.join( '' )
                  str = str.gsub( var, rindex.to_s )
              when '{{cindex}}'
                  str = str.gsub( var, cindex.to_s )
              when '{{key}}'
                  str = str.gsub( var, key.to_s )
              when '{{mode}}'
                  str = str.gsub( var, mode.to_s )
            else
              error = "  \"#{var}\" - Variable not found."
              errors.push( error )
            end
          end
        end
      end
      p[:print][:left] = str
      return [ p, errors ]
    end

    
    case mode
      when :left
        p = {
          print: {
            left: '[{{rindex}}]  {{key}} {{left__spaces}}  '
          },
          style: {
            spaces: ' ',
            steps: '.'
          },
          left: {
            max: nil,
            spaces: nil
          },
          right: {
            boxes_total: 30,
            box_current: nil,
            box: nil,
            boxes: nil,
            length_max: nil,
            mark: nil
          }
        }

        errors = []
        messages = []
        p, errors = self.options_insert( p, arr, rindex, cindex, key, mode, options )
        messages.concat( errors )

        p[:left][:max] = arr.keys.map { | aa | aa.length }.max
        p[:left][:spaces] = ( p[:left][:max] - key.length ).times.map { | a | p[:style][:spaces] }.join( '' )

        p[:right][:box_current] = 0
        p[:right][:mark] = 0
        p[:right][:length_max] = arr[ key ].length
        p[:right][:box] = p[:right][:length_max] / p[:right][:boxes_total]
        p[:right][:boxes] = ( 1..p[:right][:boxes_total] ).map { | a | p[:right][:box] * a }

        p, errors = self.options_print_left( p, arr, rindex, cindex, key, mode, options )
        messages.concat( errors )

        if messages.length != 0 and rindex == 0
          puts 'Following errors occured:'
          messages.each do | message | 
            puts message
          end
          puts
        end
          
        print( p[:print][:left] )
      when :right
        if !p[:right][:boxes].find_index( cindex ).nil? and p[:right][:boxes].find_index( cindex ) != p[:right][:box_current]
          box_new = p[:right][:boxes].find_index( cindex )
          
          ( box_new - p[:right][:box_current] ).times.each do | a | 
            if p[:right][:mark] < p[:right][:boxes_total]
                print( p[:style][:steps] )
            end
            p[:right][:mark] = p[:right][:mark] + 1
          end

          p[:right][:box_current] = box_new        
        end

        if cindex == arr[ key ].length-1 and p[:right][:mark] != arr[ key ].length-1
          c = p[:right][:boxes_total] - p[:right][:mark]
          c > ( arr[ key ].length-1 ) ? c = arr[ key ].length-1 : ''
          c.times.each do | a |
              print( p[:style][:steps] )
          end
        end
    else
    end
  
    return p
  end


  def self.example()
    groups = {}
    examples = [ 
      'Nurwë',
      'Legolas',
      'Primrose Boffin',
      'Aranuir',
      'Ruby Gardner',
      'Harding',
      'Írimon',
      'Torhir Ifant',
      'Anairë',
      'Golasgil',
      'Mîm',
      'Tobold Hornblower',
      'Thrór',
      'Gerda Boffin' 
    ]
    examples.each { | key | groups[ key ] = 
      rand( 0..rand( 0..100 ) ).times.map { | a | rand( 0..100 ) } }

    return groups
  end
end
