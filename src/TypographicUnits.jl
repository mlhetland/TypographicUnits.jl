__precompile__()
module TypographicUnits
export pt, bp, pc, dd, cc, nd, nc, sp, em, ex, px, en

using Unitful
using Unitful: inch, Length
import Base: +, *, -, /, show


## Absolute typographic units ################################################

# (Based on LaTeX values, cf. https://en.wikibooks.org/wiki/LaTeX/Lengths)

@unit pt "pt" Point       100inch//7227  false
@unit bp "bp" BigPoint       inch//72   false
@unit pc "pc" Pica           12pt        false
@unit dd "dd" Didôt        1238pt//1157  false
@unit cc "cc" Cîcero           dd//12    false
@unit nd "nd" NewDidôt      685pt//642   false
@unit nc "nc" NewCicero    1370pt//107   false
@unit sp "sp" ScaledPoint      pt//65536 false


## Relative typographic units ################################################

# The magnitudes of the units em, ex and px are unknown, and so lenghts
# measured in these units are incommensurable with other lengths, and with
# each other. Therefore they are each given a separate length-like dimension.

@dimension 𝐄𝐌 "𝐄𝐌" EmLength
@dimension 𝐄𝐗 "𝐄𝐗" ExLength
@dimension 𝐏𝐗 "𝐏𝐗" PxLength

@refunit   em "em" Em 𝐄𝐌    false
@refunit   ex "ex" Ex 𝐄𝐗    false
@refunit   px "px" Px 𝐏𝐗    false
@unit      en "en" En em//2 false


## A mixture of incommensurable length-like values ###########################

struct MixedLength{T <: Real,
    L<:Length{T}, M<:EmLength{T}, X<:ExLength{T}, P<:PxLength{T}} <: Number
    len::L
    ems::M
    exs::X
    pxs::P
end

MixedLength(len::L, ems::M, exs::X, pxs::P) where {T <: Real,
    L <: Length{T}, M <: EmLength{T}, X <: ExLength{T}, P <: PxLength{T}} =
    MixedLength{T, L, M, X, P}(len, ems, exs, pxs)

MixedLength(len::L, ems::M, exs::X, pxs::P) where
    {L <: Length, M <: EmLength, X <: ExLength, P <: PxLength} =
    MixedLength(_promote(len, ems, exs, pxs)...)

const M = MixedLength
getfields(x::M) = x.len, x.ems, x.exs, x.pxs

M(x::Length)   = M(  x, 0em, 0ex, 0px)
M(x::EmLength) = M(0pt,   x, 0ex, 0px)
M(x::ExLength) = M(0pt, 0em,   x, 0px)
M(x::PxLength) = M(0pt, 0em, 0ex,   x)


## Some limited mixed arithmetic #############################################

+(x::M, y::M)    = M(getfields(x) .+ getfields(y)...)
-(x::M, y::M)    = M(getfields(x) .- getfields(y)...)
-(x::M)          = M(.- getfields(x)...)
*(x::Real, y::M) = M(x .* getfields(y)...)

*(x::M, y::Real) = y * x
/(x::M, y::Real) = x * inv(y)

# Unitful.jl already uses the promotion mechanism on the generated
# unit-related types, so promoting two incommensurable length-like quantities
# to a MixedLength may not be altogether straightforward. Instead, we'll just
# hard-code the operators we need:

const LengthNames = (:Length, :EmLength, :ExLength, :PxLength, :M)
for S in LengthNames, T in LengthNames
    S == T && continue
    @eval +(x::$S, y::$T) = M(x) + M(y)
    @eval -(x::$S, y::$T) = M(x) - M(y)
end


## Pretty-printing ###########################################################

function show(io::IO, x::M)

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

# Currently (v. 0.7.0), the Unitful.jl promotion implementation doesn't work
# for more than three values [1], so here's a local alternative, sidestepping
# much of the promotion machinery.
# [1]: https://github.com/ajkeller34/Unitful.jl/issues/119
_promote(x...) = (T=promote_type(map(typeof, x)...); map(y->convert(T, y), x))

##############################################################################

const localunits = Unitful.basefactors
function __init__()

    merge!(Unitful.basefactors, localunits)
    Unitful.register(TypographicUnits)

    # Seems to be required (Unitful 0.7.0), even though this is called by
    # @refunit:
    Unitful.preferunits(em, ex, px)

end

end
