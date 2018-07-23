# What's FileMaker by Regexp ?
  This is a tool for making new files by regular expression.  
  This tool reads a file written in regular expression and makes new files of picking phrases.  
  This'll help at the time you want to pick phrases from a big log file or many files.  
# Usage
  1. Put a file named 'regexp.txt' written in regular expression and some files you want to trim same directory.  
  2. Run this script like; 'ruby file_maker.rb'  
  3. And input **absolute** path to the directory. ex) /path/to/directory  
  4. Then you can find new files at the specified folder.  
# Notice
  - You can write some lines not only one line in the regexp.txt.  
  - If you want to change the regular expression file name or folder name for new files,  
    you can custom them by changing constant 'REGEXP_FILE' or 'NEW_FOLDER'.  
# Contributing
  This is my first tool.  
  I'm veeeeery grad if you file an issue, pull request or something.  
# License
  Copyright (c) 2018 Maki Kawahara  
  Released under the MIT license  
  https://opensource.org/licenses/mit-license.php  

# ファイルメイカー from 正規表現とは
  正規表現を記述したファイルを読込み、正規表現で抽出したい部分を抽出し、新しいファイルを作成するツールです。  
  大量のログから必要な情報を抽出する時等に便利です。  
# 使用法
  1. 正規表現を記述した'regexp.txt'と、正規表現で置換したいファイルを好きなディレクトリに置きます。  
  2. file_makerを実行します; 'ruby file_maker.rb'  
  3. 先ほどファイルを置いたディレクトリのパスを **絶対パスで** 入力します。 例) /path/to/directory  
  4. 'Finished!'のメッセージが出たら、置換されたファイルフォルダが同じディレクトリに作成されています  
# 注意点
  - 正規表現は複数行書くことができます  
  - 正規表現ファイルや置換フォルダ名は'REGEXP_FILE', 'NEW_FOLDER'定数で変更できます  
