namespace PolyglotRegistration.Validators
{
    public class EmailValidator : IValidator<string>
    {
        public bool IsValid(string inputValue)
        {
            return true;
        }
    }
}
