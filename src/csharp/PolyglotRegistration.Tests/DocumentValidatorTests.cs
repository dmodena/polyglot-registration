using PolyglotRegistration.Validators;
using Xunit;

namespace PolyglotRegistration.Tests
{
    public class DocumentValidatorTests
    {
        [Theory]
        [InlineData("123.456.789-52", true)]
        [InlineData("583.432.413-38", true)]
        [InlineData("490.864.567-90", true)]
        [InlineData("541.942.634-82", false)]
        [InlineData("641.740.159-50", false)]
        [InlineData("813.321.999-01", false)]
        [InlineData("123.456.78-958", false)]
        [InlineData("123.45.6.789-58", false)]
        [InlineData("123-456.789-58", false)]
        [InlineData("ab3.456.789-58", false)]
        [InlineData("123.456.789-x?", false)]
        public void ShouldValidateDocument(string document, bool isValid)
        {
            var sut = new DocumentValidator();

            var result = sut.IsValid(document);

            Assert.Equal(isValid, result);
        }
    }
}
