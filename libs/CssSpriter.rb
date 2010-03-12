# encodings=utf-8

require "nokogiri"
require "libs/Tsumekomi.rb"

class CssSpriter

    # io and file is ok
    def initialize(argv, dirname=nil)
        @source = argv

        if !dirname then
            if argv.is_a? IO then
                @dirname = File.dirname(argv.path)
            else
                @dirname = ""
            end
        else 
            @dirname = dirname
        end

        self.parse(@source)
    end

    def parse(source)
        @html_dom = Nokogiri::HTML(source)
    end

    def make_sprite(destination)
        images = self.get_image_list
        pp images
    end

    def get_image_list
        img_tags = @html_dom / "img"

        filenames = []
        img_tags.each do |img|
            filenames << "#{@dirname}/#{img["src"]}"
        end

        return filenames
    end

    def tsumekomi(filenames, destination)
        Tsumekomi.tsumekomi(filenames, destination)
    end

end
