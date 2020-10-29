using System;
using System.Text.RegularExpressions;
namespace PolyglotRegistration.Validators
{
    public class EmailValidator : IValidator<string>
    {
        public bool IsValid(string inputValue)
        {
            Regex regex = new Regex(@"^[a-z0-9][a-z0-9.]*@[a-z0-9]*\.?[a-z0-9.]*[a-z0-9]$");
            Match match = regex.Match(inputValue);
            if (match.Success)
                return true;
            return false;
        }
    }
}
