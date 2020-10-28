namespace PolyglotRegistration.Validators
{
    public interface IValidator<T>
    {
        public bool IsValid(T inputValue);
    }
}
