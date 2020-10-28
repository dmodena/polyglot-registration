using System.Text.RegularExpressions;

namespace PolyglotRegistration.Validators
{
    public class NameValidator : IValidator<string>
    {
        public bool IsValid(string inputValue)
        {
            if (Regex.IsMatch(inputValue, @"^[a-zA-Z- ]+$") && inputValue.Contains(" ") && char.IsUpper(inputValue[0]))
            {
                for (int i = 1; i < inputValue.Length; i++)
                {
                    if (inputValue[i] == ' ' || inputValue[i] == '-')
                    {
                        if (char.IsUpper(inputValue[i + 1]))
                        {
                            i++;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else if (!char.IsLower(inputValue[i]))
                    {
                        return false;
                    }
                }
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}

