class WebGadget
    def initialize(stuff)
        @stuff = stuff
    end

    def parameter(parameter_name)
        @stuff[parameter_name]
    end

    def variable(variable_name)
      @stuff[variable_name]
    end

    def write_line(message)
      puts(message)
    end
end
