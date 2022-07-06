local Vector = {}

function Vector.proj(v, u)
    return v:Dot(u)/v.Magnitude * v.Unit
end

function Vector.perp(v, u)
    return u - Vector.proj(v, u)
end

return Vector