# FileMaker by Regexp
#   Copyright Maki Kawahara
#   Released under the MIT license
# https://github.com/makicamel/file_maker

require 'fileutils'

class TrimFile

  REGEXP_FILE = "regexp.txt"
  NEW_FOLDER  = "new"

  def main
    p 'Input /path/to/folder and press return.'
    p 'Notice: Only ** absolute ** path is available.'
    folder_path = gets.chomp
    return unless collect_path?(folder_path)

    new_folder_path  = "#{folder_path}/#{NEW_FOLDER}"
    regexp_file_path = "#{folder_path}/#{REGEXP_FILE}"
    row_file_list    = Dir.glob("#{folder_path}/*").reject{|path| path == regexp_file_path || File.ftype(path) != 'file'}
    regexp = get_regexp(regexp_file_path)
    new_files = sub_files(row_file_list, regexp)

    make_dir(new_folder_path)
    make_new_files(new_files, new_folder_path)

    p 'Finished!'
  end

  private
  def collect_path?(folder_path)
    unless File.exists?(folder_path)
      p "Wrong path error. There is no file/directory for '#{folder_path}'"
      return false
    end
    unless File.ftype(folder_path) == 'directory'
      p "Wrong path error. '#{folder_path}' isn't a directory. "
      return false
    end
    unless File.exists?("#{folder_path}/#{REGEXP_FILE}")
      p 'No file error. Place your regexp file in your inputted path.'
      return false
    end
    if Dir.glob("#{folder_path}/*").size == 1
      p "No file error. Place a file to be trimmed."
      return false
    end
    true
  end

  def sub_files(row_file_list, regexp)
    new_files = {}
    row_file_list.each do |row_file_path|
      File.open(row_file_path,'r') do |row_file|
        new_lines = []
        while row_line = row_file.gets
          regexp.each do |exp|
            if row_line =~ exp
              match_words = []
              (Regexp.last_match.size-1).times do |idx|
                match_words << Regexp.last_match[idx+1]
              end
              new_lines << match_words.join(", ") if match_words.size > 0
            end
          end
        end
        new_files[File.basename(row_file_path).to_sym] = new_lines
      end
    end
    new_files
  end

  def get_regexp(regexp_file_path)
    regexp = []
    File.open(regexp_file_path,'r') do |f|
      while line = f.gets
        regexp << Regexp.new(line.chomp)
      end
    end
    regexp
  end

  def make_dir(new_folder_path)
    FileUtils.mkdir(new_folder_path) unless File.exists?(new_folder_path)
  end

  def make_new_files(new_files, new_folder_path)
    new_files.each do |new_file_name, new_lines|
      File.open("#{new_folder_path}/#{Time.now.strftime('%Y%m%d%H%M%S')}_#{new_file_name}", 'w') do |f|
        lines = new_lines.join("\n")
        f.write(lines)
      end
    end
  end
end

tf = TrimFile.new
tf.main
