with AUnit.Assertions; use AUnit.Assertions;
with FizzBuzz;

package body FizzBuzz_Tests is

   procedure Life_The_Universe_And_Everything
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (FizzBuzz.Answer = 42,
              "Answer was" & Integer'Image (FizzBuzz.Answer));
   end Life_The_Universe_And_Everything;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Life_The_Universe_And_Everything'Access,
                        "life, the universe, and everything");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("FizzBuzz");
   end Name;

end FizzBuzz_Tests;
