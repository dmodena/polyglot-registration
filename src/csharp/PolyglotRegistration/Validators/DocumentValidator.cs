using System.Text.RegularExpressions;

namespace PolyglotRegistration.Validators
{
    public class DocumentValidator : IValidator<string>
    {
        public bool IsValid(string inputValue)
        {
            //This regex will match the format specified in the documentation and put each group of digits in a capturing group
            Regex rx = new Regex(@"^([0-9]{3})\.([0-9]{3})\.([0-9]{3})-([0-9]{2})$");
            //Get a match object containing match info
            Match match = rx.Match(inputValue);

            //If there was not a match, the document is incorrectly formatted
            if (!match.Success) return false;

            //Get the sum and product of the digits
            int digitSum = 0;
            int digitProduct = 1;

            //Run through capturing groups 1 to 3, corresponding to the 3 first groups digits
            for (int i = 1; i <= 3; i++)
            {
                //Get the digits as a string
                string digits = match.Groups[i].Value;

                //Run through each character in the digit string, parse it as an integer, and add it to the sum
                for (int j = 0; j < digits.Length; j++)
                {
                    digitSum += int.Parse(digits[j].ToString());
                }

                //Parse the whole digit string and multiply the product with it
                digitProduct *= int.Parse(digits);
            }

            //Validate ending digits
            //Match group 4 is the 2 digits after the dash
            string lastDigits = match.Groups[4].Value;
            bool firstDigitValid = int.Parse(lastDigits[0].ToString()) == digitSum % 10;
            bool secondDigitValid = int.Parse(lastDigits[1].ToString()) == digitProduct % 10;

            //Return true if both digits are valid, otherwise return false
            return firstDigitValid && secondDigitValid;
        }
    }
}
