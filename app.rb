require './models/solver'

get "/" do
  # @example = Solver.new(File.readlines(File.expand_path("./sample_unsolved.txt")).first).sudoku_board
  erb :home
end

post "/solve" do
  content_type :json
  @results = Solver.new(params[:data]).solve!
  @results.to_json
end