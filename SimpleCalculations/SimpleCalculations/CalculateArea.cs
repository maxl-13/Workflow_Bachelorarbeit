namespace SimpleCalculations
{
    public class CalculateArea
    {
        public static double Rectangle(double a, double b)
        {
            return a * b;
        }

        public static double Trianlge(double c, double h)
        {
            return c * h * 0.5;
        }

        public static double Circle(double r)
        {
            return Math.PI *Math.Pow(r, 2);
        }

    }
}