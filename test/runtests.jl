using UnitfulTypo
using Base.Test

const ABSOLUTE = pt, bp, pc, dd, cc, nd, nc, sp
const RELATIVE = em, ex, px, en

for x in ABSOLUTE, y in ABSOLUTE
    (3.4x + 2y//9)/4
end
for x in RELATIVE
    9*(9x - 3.14x)
end

for x in ABSOLUTE, y in RELATIVE
    y == en && continue
    5y//15 - 1x + 2.4y
end

const io = IOBuffer()
result() = String(take!(io))

show(io, (2pt + 4em + 6ex + 8px)/2)
@test result() == "1.0 pt + 2.0 em + 3.0 ex + 4.0 px"

show(io, 3.1pt - 4.3ex)
@test result() == "3.1 pt - 4.3 ex"

show(io, 3px + 4.0em)
@test result() == "4.0 em + 3.0 px"
