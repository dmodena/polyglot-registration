using PolyglotRegistration.Validators;
using Xunit;

namespace PolyglotRegistration.Tests
{
    public class EmailValidatorTests
    {
        [Theory]
        [InlineData("person@example.com", true)]
        [InlineData("person@co", true)]
        [InlineData("name.lastname@example.com", true)]
        [InlineData("person2@test.org", true)]
        [InlineData("Person@Example.com", false)]
        [InlineData("person+3@example.com", false)]
        [InlineData("pe@rson@example.com", false)]
        [InlineData(".person@example.com", false)]
        [InlineData("person@example.com.", false)]
        [InlineData("person@", false)]
        public void ShouldValidateEmail(string email, bool isValid)
        {
            var sut = new EmailValidator();

            var result = sut.IsValid(email);

            Assert.Equal(isValid, result);
        }
    }
}
