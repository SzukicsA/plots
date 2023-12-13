using Chain
using CSV, DataFrames

using CairoMakie, AlgebraOfGraphics


# Data
# --------
d = @chain DataFrame(x = range(0, 10, length = 50)) begin
  transform(:x => ByRow(x -> 0.5 * sin(x)) => :y1)
  transform(:x => ByRow(x -> 1.8 * sin(x)) => :y2)
  transform(:x => ByRow(x -> 0.3 * x) => :y3)
  stack([:y1, :y2, :y3], variable_name = :name)
end

# Plot
# --------
p = data(d) * mapping(:x, :value, color = :name) * visual(Lines)
p |> draw

p2 = data(d) * mapping(:x, :value, color = :name, row = :name => sorter("y3", "y2", "y1")) * visual(Lines)
p2 |> draw


# Figure
# --------
set_aog_theme!()
update_theme!(fontsize = 40)
f = Figure(; size = (2400, 1600))
for i in 1:4
  draw!(f[i,1], p) 
end


draw!(f[1,2], p2) 
f

