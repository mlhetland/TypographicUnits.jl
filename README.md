# UnitfulTypo

A supplemental units package for
[Unitful](https://github.com/ajkeller34/Unitful.jl), for dealing with
typographic units. For example:

```jl
julia> 1pt + 1pc |> bp
10400//803 bp
```

For absolute units like `pt`, `dd`, etc., that's basically all there is to it.
Relative units like the `em` provide more of a challenge, as their definition
depends on the current font, wherever a given measurement is to be used.
`UnitfulTypo` makes no assumptions here, and rather treats incommensurable
relative units as separate “length-like” dimensions.

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

```
julia> (6pt + 12em)/2
3.0 pt + 6.0 em
```

There are currently separate length-like dimensions defined for the units
`em`, `ex` and `px`. (The last relative unit defined, the `en`, is set to half
an `em`, and thus shares its dimension.)
