require './models/solver'

get "/" do
  erb :home
end

post "/solve" do
  content_type :json
  @results = Solver.new(params[:inputs]).solve!
  @results.to_json
end