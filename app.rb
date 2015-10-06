require 'rubygems'
require 'bundler'

Bundler.require

require './models/solver'

get "/" do
  @example = Solver.new(File.readlines(File.expand_path("./sample_unsolved.txt")).first).sudoku_board
  erb :home
end