using RoughlyRational
using Test

@testset "RoughlyRational.jl" begin
    # maybeinteger(x)
    # for i in 1:15
    #     println("@test maybeinteger(1e-$i) == ", maybeinteger(1e-1^i))
    # end
    @test maybeinteger(1e-1) == false
    @test maybeinteger(1e-2) == false
    @test maybeinteger(1e-3) == false
    @test maybeinteger(1e-4) == false
    @test maybeinteger(1e-5) == false
    @test maybeinteger(1e-6) == false
    @test maybeinteger(1e-7) == false
    @test maybeinteger(1e-8) == false
    @test maybeinteger(1e-9) == false
    @test maybeinteger(1e-10) == false
    @test maybeinteger(1e-11) == false
    @test maybeinteger(1e-12) == false
    @test maybeinteger(1e-13) == true
    @test maybeinteger(1e-14) == true
    @test maybeinteger(1e-15) == true
    # roughlyRational(x)
    # for i in 2:15
    #     println("@test roughlyRational(0.4", "9" ^ (i-1), ") == ", roughlyRational(0.5 - 1e-1^i))
    # end
    @test roughlyRational(0.49) == 49//100
    @test roughlyRational(0.499) == 499//1000
    @test roughlyRational(0.4999) == 4999//10000
    @test roughlyRational(0.49999) == 49999//100000
    @test roughlyRational(0.499999) == 1//2
    @test roughlyRational(0.4999999) == 1//2
    @test roughlyRational(0.49999999) == 1//2
    @test roughlyRational(0.499999999) == 1//2
    @test roughlyRational(0.4999999999) == 1//2
    @test roughlyRational(0.49999999999) == 1//2
    @test roughlyRational(0.499999999999) == 1//2
    @test roughlyRational(0.4999999999999) == 1//2
    @test roughlyRational(0.49999999999999) == 1//2
    @test roughlyRational(0.499999999999999) == 1//2
end
