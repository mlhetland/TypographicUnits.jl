module TypographicUnits

export pt, bp, pc, dd, cc, nd, nc, sp, em, ex, px, en

using Unitful
using Unitful: inch, Length


## Absolute typographic units ################################################

# (Based on LaTeX values, cf. https://en.wikibooks.org/wiki/LaTeX/Lengths)

@unit pt    "pt"       Point         (100//7227)inch    false
@unit bp    "bp"       BigPoint      (1//72)inch        false
@unit pc    "pc"       Pica          12pt               false
@unit dd    "dd"       Didôt         (1238//1157)pt     false
@unit cc    "cc"       Cîcero        (1//12)dd          false
@unit nd    "nd"       NewDidôt      (685//642)pt       false
@unit nc    "nc"       NewCicero     (1370//107)pt      false
@unit sp    "sp"       ScaledPoint   (1//65536)pt       false


## Relative typographic units ################################################

# The magnitudes of the units em, ex and px are unknown, and so lenghts
# measured in these units are incommensurable with other lengths, and with
# each other. Therefore they are each given a separate length-like dimension.

@dimension 𝐄𝐌 "𝐄𝐌" EmLength
@dimension 𝐄𝐗 "𝐄𝐗" ExLength
@dimension 𝐏𝐗 "𝐏𝐗" PxLength

@refunit em    "em"       Em    𝐄𝐌          false
@refunit ex    "ex"       Ex    𝐄𝐗          false
@refunit px    "px"       Px    𝐏𝐗          false
@unit    en    "en"       En    (1//2)em    false


## A mixture of incommensurable length-like values ###########################

struct MixedLength{
    L <: Length{<:Real},
    M <: EmLength{<: Real},
    X <: ExLength{<: Real},
    P<: PxLength{<: Real},
} <: Number
    len::L
    ems::M
    exs::X
    pxs::P
end

getfields(x::MixedLength) = x.len, x.ems, x.exs, x.pxs

MixedLength(x::Length)   = MixedLength(x, 0em, 0ex, 0px)
MixedLength(x::EmLength) = MixedLength(0pt, x, 0ex, 0px)
MixedLength(x::ExLength) = MixedLength(0pt, 0em, x, 0px)
MixedLength(x::PxLength) = MixedLength(0pt, 0em, 0ex, x)


## Some limited mixed arithmetic #############################################

import Base: +, *, -, /

+(x::MixedLength, y::MixedLength) = MixedLength(getfields(x) .+ getfields(y)...)
-(x::MixedLength, y::MixedLength) = MixedLength(getfields(x) .- getfields(y)...)
-(x::MixedLength)                 = MixedLength(.- getfields(x)...)
*(x::Real, y::MixedLength)        = MixedLength(x .* getfields(y)...)

*(x::MixedLength, y::Real) = y * x
/(x::MixedLength, y::Real) = x * inv(y)

# Unitful.jl already uses the promotion mechanism on the generated
# unit-related types, so promoting two incommensurable length-like quantities
# to a MixedLength may not be altogether straightforward. Instead, we'll just
# hard-code the operators we need:

const TYPO_LENGTHS = (:Length, :EmLength, :ExLength, :PxLength, :MixedLength)
for S in TYPO_LENGTHS, T in TYPO_LENGTHS
    S == T && continue
    @eval +(x::$S, y::$T) = MixedLength(x) + MixedLength(y)
    @eval -(x::$S, y::$T) = MixedLength(x) - MixedLength(y)
end


## Mathematical functions ####################################################

# For now, just float. Any other functions that make sense here would be
# easy enough to add.

import Base: float

for func in (:float,)
    @eval $func(x::MixedLength) = MixedLength($func.(getfields(x))...)
end


## Pretty-printing ###########################################################

import Base: show

function show(io::IO, x::MixedLength)
    compact = get(io, :compact, false)
    plus = compact ? "+" : " + "
    minus = compact ? "-" : " - "

    first = true
    for val in getfields(x)
        if !iszero(val)
            if !first
                print(io, sign(val) < 0 ? minus : plus)
                val = abs(val)
            end
            show(io, val)
            first = false
        end
    end

    first && show(io, x.len)
end


##############################################################################

# Register the TypographicUnits.jl extension to Unitful.jl [1]
#
# [1]: https://painterqubits.github.io/Unitful.jl/stable/extending/
const localunits = copy(Unitful.basefactors)
const localpromotion = copy(Unitful.promotion)
function __init__()
    merge!(Unitful.basefactors, localunits)
    # TODO: do we need this promotion step?
    merge!(Unitful.promotion, localpromotion)  # only if you've used @dimension

    # Register extension to Unitful.jl
    Unitful.register(TypographicUnits)

    # We probably don't want to convert to meters if we mix in mm or cm.
    # (Requires that this is imported before, say, Unitful.DefaultSymbols.)
    Unitful.preferunits(pt)
end

end
