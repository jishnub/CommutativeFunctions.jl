module CommutativeFunctions

export @commutative

"""
	@commutative f(x::T1, y::T2) = ...

Declare a method definition of a binary function to be commutative in the arguments. 
If the two arguments are of different types, this will generate a second method with the 
arguments swapped that is identical in its definition.

# Example
```jldoctest; setup=:(using CommutativeFunctions)
julia> @commutative f(x::Int, y::Float64) = x + y
f (generic function with 2 methods)

julia> f(1, 2.0)
3.0

julia> f(2.0, 1)
3.0
```
"""
macro commutative(ex)
	if ex.head != :(=)
		throw(ArgumentError("argument to @commutative must be a method definition"))
	end
	lhs = ex.args[1]
	rhs = ex.args[2]
	if lhs.head != :call
		throw(ArgumentError("unable to parse expression"))
	end
	f = lhs.args[1]
	if length(lhs.args) != 3
		throw(ArgumentError("the function $f must have two arguments"))
	end
	arg1 = lhs.args[2]
	arg2 = lhs.args[3]
	
	quote 
		$(esc(f))($arg2, $arg1) = $(rhs.args[2]);
		$(esc(f))($arg1, $arg2) = $(rhs.args[2]);
	end
end

end
