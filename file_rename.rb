module Renamer
  class Application
    def initialize
      @directory = Dir.pwd
    end

    def start
      puts "What file extension do you want to change?"
      extension = gets.chomp
      puts "What do you want to change it to?"
      change_to = gets.chomp
      Dir.foreach(@directory) do |file|
        next if file == '.' or file == '..'
        file_ext = File.extname(file)
        name = File.basename(file, File.extname(file))
        if file_ext == extension
          File.rename(name + file_ext, name + change_to)
        end
      end

      puts "Renaming completed!"

    end

  end

  app = Application.new()
  app.start

end
