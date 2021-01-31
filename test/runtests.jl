using CommutativeFunctions
using Test

@testset "CommutativeFunctions.jl" begin
    @commutative f(a::Int, b::Float64) = a + b
    @test f(2, 3.0) == 5
    @test f(3.0, 2) == 5

    @test_throws Exception @eval (@commutative g(x) = x)
    @test_throws Exception @eval (@commutative g(x, y, z) = x)
    @test_throws Exception @eval @commutative :+
end
