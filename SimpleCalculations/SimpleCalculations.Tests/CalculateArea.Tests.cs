using Xunit;
using SimpleCalculations;

namespace SimpleCalculations.Tests
{
    public class UnitTest1
    {
        [Theory]
        [InlineData(4, 3, 12)]
        [InlineData(21, 5.25, 110.25)]
        [InlineData(double.MaxValue, 1, double.MaxValue)]
        public void Add_SimpleValuesShouldCalculate(double a, double b, double expected)
        {
            double actual = CalculateArea.Rectangle(a, b);
            Assert.Equal(expected, actual);
        }
    }
}