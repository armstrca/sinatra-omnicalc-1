require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
@number = params.fetch("number")
@num_sq = (@number.to_f)**2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
@number = params.fetch("number")
@num_sqrt = (@number.to_f)**0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
@apr = ((params.fetch("apr")).to_f)
@aprpretty = (@apr.to_fs(:percentage))
@years = params.fetch("years")
@months = (@years.to_i * 12)
@aprmonthly = @apr/12
@principal = (params.fetch("principal")).to_f
@payment_num = ((@aprmonthly/100) * @principal)
@payment_denom = (1 - ((1 + (@aprmonthly/100)))**(-@months))
@payment = ((@payment_num.to_f)/(@payment_denom.to_f)).to_fs(:currency)
  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @output = rand(@min..@max)
erb(:random_results)
end
