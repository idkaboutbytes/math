--!native

local MathUtils = require(".")

return function()
	describe("MathUtils.map", function()
		it("maps numbers between ranges", function()
			expect(MathUtils.map(0.5, 0, 1, 0, 10)).to.equal(5)
		end)

		it("maps non-negative values", function()
			expect(MathUtils.mapNonNegative(-1, 0, 1, 0, 10)).to.equal(0)
		end)
	end)

	describe("MathUtils numeric helpers", function()
		it("jitters around an average deterministically with provided random value", function()
			expect(MathUtils.jitter(10, 4, 0.5)).to.equal(10)
		end)

		it("adds commas to large numbers", function()
			expect(MathUtils.addCommas(1234567)).to.equal("1,234,567")
		end)

		it("increments nextOrder closures", function()
			local nextOrder = MathUtils.nextOrder()
			expect(nextOrder()).to.equal(1)
			expect(nextOrder()).to.equal(2)
		end)

		it("detects NaN", function()
			expect(MathUtils.isNaN(0 / 0)).to.equal(true)
			expect(MathUtils.isNaN(1)).to.equal(false)
		end)

		it("lerps numbers", function()
			expect(MathUtils.lerp(0, 10, 0.25)).to.equal(2.5)
		end)

		it("rounds numbers", function()
			expect(MathUtils.round(72.1, 5)).to.equal(70)
			expect(MathUtils.roundUp(72.1, 5)).to.equal(75)
			expect(MathUtils.roundDown(72.1, 5)).to.equal(70)
		end)

		it("computes factors", function()
			local factors = MathUtils.factors(6)
			expect(#factors).to.equal(4)
			expect(factors[3]).to.equal(3)
		end)

		it("computes averages", function()
			expect(MathUtils.average(4, 1, 2, 3, 4)).to.equal(2.5)
		end)
	end)

	describe("MathUtils.computeTrajectory", function()
		it("returns a fallback or valid trajectories", function()
			local low, high, fallback = MathUtils.computeTrajectory(Vector3.zero, Vector3.new(10, 0, 0), 50, 196.2)

			expect(low ~= nil or high ~= nil or fallback ~= nil).to.equal(true)
		end)
	end)
end
