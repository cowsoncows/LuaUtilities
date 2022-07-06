-- Maps a value n from [a1, b1] to [a2, b2]
return function(n, a1, b1, a2, b2)
    assert(type(n) == "number", "Map value must be a number")
    assert(
        type(a1) == "number" and type(b1) == "number" and
        type(a2) == "number" and type(b2) == "number",
        "Map ranges must be numbers"
    )
    
    return (n - a1) * (b2 - a2) / (b1 - a1) + a2
end