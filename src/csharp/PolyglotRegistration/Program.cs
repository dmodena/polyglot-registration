using PolyglotRegistration.Validators;
using System;

namespace PolyglotRegistration
{
    class Program
    {
        static void Main(string[] args)
        {
            var nameValidator = new NameValidator();
            var documentValidator = new DocumentValidator();
            var emailValidator = new EmailValidator();
            bool isValid;

            Console.WriteLine("Please insert required data below.");

            do
            {
                Console.Write("Name: ");
                var name = Console.ReadLine();
                isValid = nameValidator.IsValid(name);

                if (!isValid) Console.WriteLine("Name is invalid.");
            } while (!isValid);


            do
            {
                Console.Write("Document: ");
                var document = Console.ReadLine();
                isValid = documentValidator.IsValid(document);

                if (!isValid) Console.WriteLine("Document is invalid.");
            } while (!isValid);

            do
            {
                Console.Write("Email: ");
                var email = Console.ReadLine();
                isValid = emailValidator.IsValid(email);

                if (!isValid) Console.WriteLine("Email is invalid.");
            } while (!isValid);

            Console.WriteLine("Registration completed.");
        }
    }
}
