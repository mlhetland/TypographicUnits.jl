# TypographicUnits

A supplemental units package for
[Unitful](https://github.com/ajkeller34/Unitful.jl), for dealing with
typographic units. For example:

```jl
julia> 1pt + 1pc |> bp
10400//803 bp
```

The preferred length dimension is set to `pt`, so as not to end up with meters
if you mix in `cm` or `mm` (from `Unitful.DefaultSymbols`):

```jl
julia> 1cm + 1pt
7481//254 pt
```

For absolute units like `pt`, `dd`, etc., that's basically all there is to it.
Relative units like the `em` provide more of a challenge, as their definition
depends on the current font, wherever a given measurement is to be used.
`TypographicUnits` makes no assumptions here, and rather treats
incommensurable relative units as separate “length-like” dimensions.

Thus, where `1pc - 6pt` yields `6pt`, for example, the relative units don't
mix:

```jl
julia> 1pt + 1em
1 pt + 1 em
```

Constructing such a mixed length will promote the values to the same
underlying scalar type:

```jl
julia> 1.0pt + 1em
1.0 pt + 1.0 em
```

They can also be multiplied by (or divided by) real numbers:

```jl
julia> (6pt + 12em)/2
3.0 pt + 6.0 em
```

There are currently separate length-like dimensions defined for the units
`em`, `ex` and `px`. (The last relative unit defined, the `en`, is set to half
an `em`, and thus shares its dimension.)

If you want to do advanced calculations, you should probably do so before
combining values into a mixed length. Many computations don't really make
sense for the combinations. For example, what is `abs(1em - 10pt)`? If `1em ≥
10pt`, then it's simply `1em - 10pt`; otherwise, it's `10pt - 1em`. Since we
don't know their relative sizes, we can't meaningfully give an answer. Other
functions (such as `sqrt` or `sin`) aren't distributive, for one, and change
the units so they no longer fall within the purview of the mixed length type.
For convenience, however, the `float` function is available, in case one wants
to get rid of rationals:

```jl
julia> 3cm + 4pt + 4em
22697//254 pt + 4//1 em
julia> float(3cm + 4pt + 4em)
89.35826771653544 pt + 4.0 em
```
