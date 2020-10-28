using PolyglotRegistration.Validators;
using Xunit;

namespace PolyglotRegistration.Tests
{
    public class NameValidatorTests
    {
        [Theory]
        [InlineData("Carl Mass", true)]
        [InlineData("Nicole Grownman", true)]
        [InlineData("Jean-Paul Satire", true)]
        [InlineData("Sophie Ballot Hawk", true)]
        [InlineData("john Doe", false)]
        [InlineData("John Do3", false)]
        [InlineData("John Doe.", false)]
        [InlineData("John", false)]
        [InlineData("John   Doe", false)]
        [InlineData("John-al Doe", false)]
        [InlineData("John DoE", false)]
        public void ShouldValidateName(string name, bool isValid)
        {
            var sut = new NameValidator();

            var result = sut.IsValid(name);

            Assert.Equal(isValid, result);
        }
    }
}
